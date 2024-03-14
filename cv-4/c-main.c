#include <stdio.h>

// Declaration of the assembly function
// int Factorial(int *numbers, int size);
// void fill_pyramid_numbers(long *numbers, int size);
// long multiples(long *numbers, int size, long factor);
void change_array_by_avg(long *array, int N);
int main()
{
    // int size = 10;
    // int numbers[size];
    // for (int i = 0; i < size; i++)
    // {
    //     numbers[i] = i + 4;
    // }

    // // Call the assembly function
    // int overflow_count = Factorial(numbers, size);

    // // Print the modified array
    // for (int i = 0; i < size; i++)
    // {
    //     printf("%d\n", numbers[i]);
    // }

    // printf("Overflow count: %d\n", overflow_count);
    //
    // long array[10];
    // fill_pyramid_numbers(array, 10);

    // for (int i = 0; i < 10; i++)
    // {
    //     printf("%ld\n", array[i]);
    // }
    // return 0;
    // //

    //

    // long numbers[] = {5, 25, 25, 105};
    // long answer2 = multiples(numbers, 4, 5);
    // for (int i = 0; i < 4; i++)
    // {
    //     printf("%ld\n", numbers[i]);
    // }
    // printf("issue numbers amount:%ld\n", answer2);

    long array[4] = {1, 2, 3, 4}; // 2,5
    // change_array_by_avg(array, 4);
    for (int i = 0; i < 4; i++)
    {
        printf("%ld\n", array[i]);
    }
}
