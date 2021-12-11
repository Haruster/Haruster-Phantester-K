#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <netinet/in.h>
#include <sys/socket.h>

#define PORT 9000

char buffer[BUFSIZ];

char* XorCrypto(char* Data, char* Key, int DataLength, int KeyLength) {

    char* output = (char*)malloc(sizeof(char) * DataLength);

    for(int i = 0; i < DataLength; ++i) {

        output[i] = Data[i] ^ Key[i % KeyLength];

    }

    return output;

}

int main(void) {
    printf("전송할 메세지를 입력해주세요. : ");
    scanf("%s", buffer);
    printf("\n");
    char* text = buffer;
    char* key = "1111";

    int c_socket, s_socket, len, n;

    int DataLength = strlen(text);
    int KeyLength = strlen(key);

    char* cipherData = XorCrypto(text, key, DataLength, KeyLength);

    struct sockaddr_in s_addr, c_addr;

    s_socket = socket(PF_INET, SOCK_STREAM, 0);

    memset(&s_addr, 0, sizeof(s_addr));

    s_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    s_addr.sin_family = AF_INET;
    s_addr.sin_port = htons(PORT);

    if(bind(s_socket, (struct sockaddr *) &s_addr, sizeof(s_addr)) == -1) {

        printf("Can not bind\n");

        return -1;

    }

    if(listen(s_socket, 5) == -1) {

        printf("Listen Fail\n");

        return -1;

    }

    while(1) {

        len = sizeof(c_addr);

        c_socket = accept(s_socket, (struct sockaddr *) &c_addr, &len);

        n = strlen(cipherData);

        write(c_socket, cipherData, n);

        close(c_socket);

    }

    close(s_socket);

}