#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

function setup () {
	mkdir -p "$SCRIPTPATH/../backup"
	mv "$SCRIPTPATH/../main.cpp" "$SCRIPTPATH/../backup/main.cpp"

	cat > "$SCRIPTPATH/../main.cpp" << EOF
#include <iostream>
#include <vector>
#include <set>
#include <queue>
#include <algorithm>
#include <string.h>
#include <limits.h>
	
using namespace std;

void solve() {

}

int main() {
	freopen("input.txt", "r", stdin);
	ios::sync_with_stdio(false);
	cin.tie(NULL);

	solve();
}

EOF
	
	# Clear input.txt
	> "$SCRIPTPATH/../input.txt"
	touch "$SCRIPTPATH/../input.txt"
}

setup
