# Minimum Spanning Tree

A minimum spanning tree (MST) or minimum weight spanning tree is a subset of the edges of a connected, edge-weighted undirected graph that connects all the vertices together, without any cycles and with the minimum possible total edge weight.[1] That is, it is a spanning tree whose sum of edge weights is as small as possible.

## Implementation

### Kruskal's algorithm

1. Create a forest (a set of trees) initially consisting of a separate single-vertex tree for each vertex in the input graph.
2. Sort the graph edges by weight.
3. Loop through the edges of the graph, in ascending sorted order by their weight. For each edge:
3-1. Test whether adding the edge to the current forest would create a cycle
3-2. If not, add the edge to the forest, combining two trees into a single tree

```
algorithm Kruskal(G) is
    F:= ∅
    for each v in G.V do
        MAKE-SET(v)
    for each {u, v} in G.E ordered by weight({u, v}), increasing do
        if FIND-SET(u) ≠ FIND-SET(v) then
            F := F ∪ { {u, v} }
            UNION(FIND-SET(u), FIND-SET(v))
    return F
```

**Time complexity**: `O(vlogv)` (dominated by sorting)

[`Disjoint set union`](/data_structure/disjoint_set_union.md) plays a key role in implementation.

**Python implementation**

```python
class DSU:
    def __init__(self, n):
        self.data = [-1 for _ in range(n+1)]
        self.size = n
    
    def find(self, index):
        v = self.data[index]
        return index if v < 0 else self.find(v)
    
    def union(self, a, b):
        a = self.find(a)
        b = self.find(b)
        if a == b:
            return False
        if self.data[a] > self.data[b]:
            a, b = b, a
        self.data[a] += self.data[b]
        self.data[b] = a
        self.size -= 1
        return True

# 1. create a DSU tree
dsu = DSU(N)

# 2. sort edges by weights
edges = sorted(edges)

# 3. loop through the edges of the graph
for x, y, cost in edges:
    dsu.union(x, y)
```

## Problems

- [가희와 여행가요](https://www.acmicpc.net/problem/30797)
