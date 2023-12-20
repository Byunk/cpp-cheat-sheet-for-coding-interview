# `std::sort`

Basic Usage:

```cpp
#include <algorithm>

int s[10] = {5, 7, 4, 2, 8, 6, 1, 9, 0, 3};
std::sort(s.begin(), s.end()); // 0 1 2 3 4 5 6 7 8 9
```

Custom `compare` object:

```cpp
int s[10] = {5, 7, 4, 2, 8, 6, 1, 9, 0, 3};

bool customGreater(const int& a, const int& b) {
    return a > b;
}

std::sort(s.begin(), s.end(), customGreater); // 9 8 7 6 5 4 3 2 1 0
```

With custom class:

```cpp
struct MyStruct
{
    int key;
    std::string stringValue;

    MyStruct(int k, const std::string& s) : key(k), stringValue(s) {}
};

bool less_than_key(const MyStruct& a, const MyStruct& b) {
    return (struct1.key < struct2.key);
}

// Alternatively,
// struct MyStruct
// {
//     int key;
//     std::string stringValue;

//     MyStruct(int k, const std::string& s) : key(k), stringValue(s) {}

//     bool operator < (const MyStruct& str) const
//     {
//         return (key < str.key);
//     }
// };

std::vector <MyStruct> vec;

vec.push_back(MyStruct(4, "test"));
vec.push_back(MyStruct(3, "a"));
vec.push_back(MyStruct(2, "is"));
vec.push_back(MyStruct(1, "this"));

std::sort(vec.begin(), vec.end(), less_than_key()); 
// MyStruct(1, "this") MyStruct(2, "is") MyStruct(3, "a") MyStruct(4, "test")
```

## Reference

https://en.cppreference.com/w/cpp/algorithm/sort