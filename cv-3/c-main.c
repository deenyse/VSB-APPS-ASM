#include <stdio.h>

int strCat(char *str, char charToFind);
char inputStr[] = "eEAhoj Svete! EeEe";
char toFind = 'e';
int count = 0;

int main()
{
    int first = strCat(inputStr, toFind);
    printf("first: %d, amout %d\n", first, count);
    return 0;
}
