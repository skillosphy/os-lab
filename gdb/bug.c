#include <stdio.h>

int sum(int *arr, int n)
{
    int total = 0;
    for (int i = 0; i <= n; i++) // BUG: should be i < n
        total += arr[i];
    return total;
}

int main(void)
{
    int nums[3] = {1, 2, 3};
    printf("sum = %d\n", sum(nums, 3));
    int *p = NULL;
    *p = 5; // BUG: crash
    return 0;
}