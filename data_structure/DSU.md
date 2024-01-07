# Disjoint Set Union

[Disjoint Set Union](https://en.wikipedia.org/wiki/Disjoint-set_data_structure) is a data structure that stores a collection of disjoint (non-overlapping) sets.

Its implementation has to support the following operations:

- `find`: given `x`, returns the set which `x` belongs to (`O(log n)` without path compression or the first call, `O(1)` with path compression)
- `union`: given `x`, `y`, merges two sets which `x` and `y` are belongs to (depends on `find` operation since it internally utilizes `find`)

It can be used to solve the following problems:

- [Kruskal's algorithm](https://en.wikipedia.org/wiki/Kruskal%27s_algorithm)
- checking connectivity in graphs

## Path compression

Path compression is a way to improve performance of opeartions by flattening the tree. Idea is to make each node directly points to the root node when `find` is called.

```
function Find(x) is
    if x.parent ≠ x then
        x.parent := Find(x.parent)
        return x.parent
    else
        return x
    end if
end function
```

## Union by size

In the case of the union by size, the node with more descendants becomes the parent.

```
function Union(x, y) is
    // Replace nodes by roots
    x := Find(x)
    y := Find(y)

    if x = y then
        return  // x and y are already in the same set
    end if

    // If necessary, swap variables to ensure that
    // x has at least as many descendants as y
    if x.size < y.size then
        (x, y) := (y, x)
    end if

    // Make x the new root
    y.parent := x
    // Update the size of x
    x.size := x.size + y.size
end function
```

## Implementation

**python**

```python
class DSU:
    def __init__(self, n):
        self.data = [-1 for _ in range(n+1)]
        self.size = n
    
    def find(self, index):
	# Path compression
        v = self.data[index]
        return index if v < 0 else self.find(v)
    
    def union(self, a, b):
        a = self.find(a)
        b = self.find(b)
        if a == b:
            return False

	# Union by size
        if self.data[a] > self.data[b]:
            a, b = b, a
        self.data[a] += self.data[b]
        self.data[b] = a
        self.size -= 1
        return True
```

**C++**

```cpp
struct DSU {
	vector<int> e;
	DSU(int N) : e(N, -1) {}

	// get representive component (uses path compression)
	int get(int x) { return e[x] < 0 ? x : e[x] = get(e[x]); }

	bool same_set(int a, int b) { return get(a) == get(b); }

	int size(int x) { return -e[get(x)]; }

	// union by size
	bool unite(int x, int y) {
		x = get(x), y = get(y);
		if (x == y) return false;
		if (e[x] > e[y]) swap(x, y);
		e[x] += e[y];
		e[y] = x;
		return true;
	}
};
```

## Problems

- [Closing the Farm (Gold)](https://www.acmicpc.net/problem/12012)
