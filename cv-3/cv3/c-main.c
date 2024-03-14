#include <stdio.h>

int strCat(char *str, char charToFind);
char inputStr[] = "eEAhoj Svete! EeEe";
char toFind = 'e';
int count = 0;
//
char buff[255] = "12345";
int num = 0;
void str2int(char *str, int *num);
//
long var = 0xf000;
char array[] = {15, 14, 13, 12, 1};
int size = 5;
int not_bits(long *var, char *array, long size);
//
int main()
{
    int first = strCat(inputStr, toFind);
    printf("first: %d, amout %d\n", first, count);
    //
    str2int(buff, &num);
    printf("num: %d\n", num);
    //
    printf("var: %x\n", var);
    printf("oneCount: %d\n", not_bits(&var, array, size));
    printf("var: %x\n", var);
    // 0xf0f0f0 -> 0xF074f7
    return 0;
}
