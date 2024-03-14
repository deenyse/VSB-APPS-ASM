#include <stdio.h>

// Declaration of the assembly function
int Factorial(int *numbers, int size);

int main()
{
    int size = 10;
    int numbers[size];
    for (int i = 0; i < size; i++)
    {
        numbers[i] = i + 4;
    }

    // Call the assembly function
    int overflow_count = Factorial(numbers, size);

    // Print the modified array
    // for (int i = 0; i < size; i++)
    // {
    //     printf("%d\n", numbers[i]);
    // }

    printf("Overflow count: %d\n", overflow_count);

    return 0;
}
