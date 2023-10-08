# C++ cheat sheet for interview

## Code Snippet

### Modify the synchronization behavior between C++'s standard input and output streams. 

```cpp
ios::sync_with_stdio(false);
cin.tie(NULL);
```

### Initialize all element of the array to the value -1 or 0.

! Do not use this method with values other than -1 or 0.

```cpp
int cache[101][101];
memset(cache, -1, sizeof(cache));
```

## Memoization

### Implementation pattern

```cpp
int cache[101][101];
...
void main(int i, int j) {
  int& ret = cache[i][j];
  if (ret != -1) return ret;
  ...
  return ret = 1;
}
```

## Operator Overloading

### Example: matrix multiplication

```cpp
matrix operator * (const matrix& a, const matrix& b) {
	matrix ret(N, vector<ll>(N));

	for (int i = 0; i < N; ++i) {
		for (int j = 0; j < N; ++j) {
			for (int k = 0; k < N; ++k) {
				ret[i][j] += a[i][k] * b[k][j];
			}
			ret[i][j] %= 1000;
		}
	}
	return ret;
}
```
