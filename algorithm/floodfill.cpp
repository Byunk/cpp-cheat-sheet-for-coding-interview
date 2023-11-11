#include <vector>

using namespace std;

const int MN = 101;
// map size
int N, M;
vector<pair<int, int> > switches;
int visited[MN][MN];
int on[MN][MN];

int dx[] = {-1, 0, 1, 0};
int dy[] = {0, 1, 0, -1};

// Flood Fill algorithm with source (x, y)
void floodfill(int x, int y) {
	if (x < 0 || y < 0 || x >= N || y >= M || visited[x][y] || !on[x][y]) return;
	
	visited[x][y] = true;

	// Iterate through neighbors and floodfill from them
	for (int i = 0; i < 4; ++i) floodfill(x + dx[i], y + dy[i]);

	// Switch stores the information as to next step
	for (auto s : switches) {
		on[s.first][s.second] = true;

		// Floodfill from next source
		floodfill(s.first, s.second);
	}
}
