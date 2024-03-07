#include <stdio.h>

int pole[] = {3, 2, 1};
int arrayPoleLength = 3;

int zapPole[] = {1, -1, 1, -1, -1, 1};
int arrayZapLength = 6;

int absArr();

int xorArray();

int main()
{
    printf("Xor result: %d\n", xorArray());

    absArr();
    for (int i = 0; i < arrayZapLength; i++)
    {
        printf("%d ", zapPole[i]);
    }
    return 0;
}
