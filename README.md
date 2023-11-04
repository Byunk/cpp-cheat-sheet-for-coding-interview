# C++ cheat sheet for interview

## [Common Mistakes](common_mistakes.md)

## C++ Basic Syntax

### [std::sort](https://en.cppreference.com/w/cpp/algorithm/sort)

Basic usage:

```cpp
#include <algorithm>

int s[10] = {5, 7, 4, 2, 8, 6, 1, 9, 0, 3};
std::sort(s.begin(), s.end()); // 0 1 2 3 4 5 6 7 8 9
```
With custom compare operator:

```cpp
int s[10] = {5, 7, 4, 2, 8, 6, 1, 9, 0, 3};

struct
{
    bool operator()(int a, int b) const { return a > b; }
}
customGreater;

std::sort(s.begin(), s.end(), customGreater); // 9 8 7 6 5 4 3 2 1 0
```

With custom object:

```cpp
struct MyStruct
{
    int key;
    std::string stringValue;

    MyStruct(int k, const std::string& s) : key(k), stringValue(s) {}
};

struct less_than_key
{
    inline bool operator() (const MyStruct& struct1, const MyStruct& struct2)
    {
        return (struct1.key < struct2.key);
    }
};

std::vector < MyStruct > vec;

vec.push_back(MyStruct(4, "test"));
vec.push_back(MyStruct(3, "a"));
vec.push_back(MyStruct(2, "is"));
vec.push_back(MyStruct(1, "this"));

std::sort(vec.begin(), vec.end(), less_than_key()); // MyStruct(1, "this") MyStruct(2, "is") MyStruct(3, "a") MyStruct(4, "test")
```

alternatively,

```
struct MyStruct
{
    int key;
    std::string stringValue;

    MyStruct(int k, const std::string& s) : key(k), stringValue(s) {}

    bool operator < (const MyStruct& str) const
    {
        return (key < str.key);
    }
};
```

### [std::accumulate](https://en.cppreference.com/w/cpp/algorithm/accumulate)

Basic usage:

```
#include <numeric>

std::vector<int> v {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
 
int sum = std::accumulate(v.begin(), v.end(), 0); // 55
int product = std::accumulate(v.begin(), v.end(), 1, std::multiplies<int>()); // 3628800
```

### [Numeric limits](https://en.cppreference.com/w/c/types/limits)

```cpp
#include <limits.h>

int int_max = INT_MAX;
int int_min = INT_MIN;
```

## Patterns

### Memoization

Example: Fibonacci number

```cpp
int cache[10001];

int fibo(int n) {
  // output: the nth fibonacci number
  if (n <= 2) return 1;

  int& ret = cache[n];
  if (ret != -1) return ret;

  return ret = fibo(n-1) + fibo(n-2);
}
```

## Simple hacks to win competitive programming problems

### Optimizing Input and Output

`ios::sync_with_stdio(false);`: By default, C++ synchronizes its standard input and output streams with the C library's input and output functions, which can be inefficient. Disabling this synchronization (false) turns off this feature, making input and output operations faster. Competitive programming usually doesn't require mixing C and C++ I/O functions, so turning off this synchronization can lead to significant speed improvements.

`cin.tie(NULL);`: This line breaks the tie between the cin (standard input stream) and cout (standard output stream). In C++, when cin is used, it often flushes the output buffer of cout. In some competitive programming scenarios, you may not want this behavior, as it can introduce unnecessary overhead. By setting cin.tie(NULL), you prevent the flushing of the output buffer when reading from the input, further improving I/O performance.

```cpp
ios::sync_with_stdio(false);
cin.tie(NULL);
```

### Initializing an array to the value -1 or 0

`memset` operates at the byte level, setting each byte in memory to the specified value. If you try to use memset to initialize an array with values different from 0 or -1, it can lead to issues because the byte representation of those values may not be the same. But meanwhile, it is very useful to use memoization or to indicate that a particular entry in the array has not been computed yet.

```cpp
#include <string.h>

int cache[101][101];
memset(cache, -1, sizeof(cache));
```
