# Memoization

Memoization is technically not an algorithm, but an optimization technique by storing the results of expensive function calls and use them again in future calls.

The basic implementation is as below:

**Example: Fibonacci number of integer n <= 10000**

```cpp
#include <string.h>

int cache[10001];

int fibo(int n) {
    if (n <= 1) return 1;

    int& ret = cache[n]

    // if cached, return the cached value
    if (ret != -1) return ret; 

    // if not compute it
    return ret = fibo(n-1) + fibo(n-2);
}

int main() {
    input()

    memset(cache, -1, sizeof(cache));
    fibo(n);
}
```