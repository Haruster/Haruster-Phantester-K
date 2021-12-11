#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <netinet/in.h>
#include <sys/socket.h>

#define PORT 9000
#define IPADDR "127.0.0.1"

int main(void) {
    
    int c_socket, len, n;
    
    char rcvBuffer[BUFSIZ];
    
    struct sockaddr_in c_addr;

    c_socket = socket(PF_INET, SOCK_STREAM, 0);
    
    memset(&c_addr, 0, sizeof(c_addr));
    
    c_addr.sin_addr.s_addr = htonl(IPADDR);
    c_addr.sin_family = AF_INET;
    c_addr.sin_port = htons(PORT);
    
    if(connect(c_socket, (struct sockaddr *) &c_addr, sizeof(c_addr)) == -1) {
        
        printf("Can not bind\n");
        
        return -1;
        
    }
    
    if((n = read(c_socket, rcvBuffer, sizeof(rcvBuffer))) < 0) {
        
        return (-1);
        
    }
    
    rcvBuffer[n] = '\0';
    
    printf("Received Data = %s\n", rcvBuffer);
    
    
    close(c_socket);
    
}
