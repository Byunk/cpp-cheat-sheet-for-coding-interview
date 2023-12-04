# Disjoint Set Union

## Usage

- Checking Connectivity in graph

## Implementation

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

`get`: `O(log n)` for the first call, then `O(1)` due to path compression

`unite`: depends on `get`

## Problems

- [Closing the Farm (Gold)](https://www.acmicpc.net/problem/12012)
