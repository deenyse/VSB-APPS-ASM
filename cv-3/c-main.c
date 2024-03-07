#include <stdio.h>

int strCat(char *str, char charToFind);
char inputStr[] = "eEAhoj Svete! EeEe";
char toFind = 'e';
int count = 0;
//
char buff[255] = "1234501";
int num = 0;
void str2int(char *str, int *num);
//
long var = 0xf0f0f0;
char array[] = {0, 1, 2, 10, 15};
int size = 5;
int not_bits(long *var, char *array, long size);
int main()
{
    int first = strCat(inputStr, toFind);
    printf("first: %d, amout %d\n", first, count);
    //
    str2int(buff, &num);
    printf("num: %d\n", num);
    //
    int oneCount = not_bits(&var, array, size);
    printf("oneCount: %d\n", oneCount);
    // 0xf0f0f0 -> 0xF074f7
    return 0;
}
/*
 mov cl, [rdi + rcx] ; load bit n


    ; xor mask with input
    xor rdi, rbx      ; xor with rbx

*/