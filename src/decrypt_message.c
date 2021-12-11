#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

char* XorCrypto(char* Data, char* Key, int DataLength, int KeyLength) {

    char* output = (char*)malloc(sizeof(char) * DataLength);

    for(int i = 0; i < DataLength; ++i) {

            output[i] = Data[i] ^ Key[i % KeyLength];

    }

    return output;

}

int main(void) {

    char* text = " "; // 암호화된 text입력

    char* key = " "; // 복호화를 위한 key입력

    int DataLength = strlen(text);
    int KeyLength = strlen(text);

    char* DecryptText = XorCrypto(text, key, DataLength, KeyLength); // xor연산

    printf("%s", DecryptText);

}
