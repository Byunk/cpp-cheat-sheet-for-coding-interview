# BitMask

When the number of elements in a set is limited to a relatively small integer, a bitmask can be employed to represent sets efficiently. The basic idea is to use each digit's index in the binary representation of an integer as a key. Here is an example of how this idea can be implemented:

```
[1, 2, 3, 4, 5] → 11111
[2, 3, 4, 5]    → 11110
[1, 2, 5]       → 10011
[2]             → 00010
```

Advantages of using a bitmask include:

1. **Speed**: Bitmask operations typically take `O(1)` time. This results in optimized performance when such operations are repeated in the code.
2. **Conciseness**: The code tends to be more compact and concise.
3. **Lower memory usage**: Allows computing more values in advance and saves space.

## Implementation

**Initialization**

```cpp
// Initialize a bitmask to represent an empty set (zero length)
unsigned int bitmask = 0;

// Initialize a bitmask to represent a full set of 32 elements
unsigned int fullset = (1 << 32) - 1;
```

**Insertion**

```cpp
// Insert the p-th element
bitmask |= (1 << p);
```

**Existence**

```cpp
// Check if the p-th element is in the set
bool exists = bitmask & (1 << p);
```

**Deletion**

```cpp
// Remove the p-th element from the set
bitmask &= ~(1 << p);
```

**Toggle**

```cpp
// Toggle the p-th element in the set
bitmask ^= (1 << p);
```

**Operations on Two Bitmasks**

```cpp
unsigned int union_set = (a | b); // union
unsigned int intersection = (a & b);
unsigned int difference = (a & ~b); // set difference where elements in b are removed from a
unsigned int symmetric_difference = (a ^ b); // toggle elements present in either set but not in both
```

**Size of the Set**

```cpp
int bitCount(unsigned int x) {
    if (x == 0) return 0;
    return x % 2 + bitCount(x / 2);
}
```

**Removing the Minimum Element**

```cpp
// Remove the lowest order bit (the smallest element)
bitmask &= (bitmask - 1);
```

**Iterating Over All Subsets**

```cpp
// Iterate through all subsets of the bitmask
for (int subset = bitmask; subset; subset = (subset - 1) & bitmask) {
    // Perform some operation with subset
    ...
}
```

## Problems

- [Graduation (in Korean)](https://algospot.com/judge/problem/read/GRADUATION)