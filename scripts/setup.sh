#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

function setup () {
	mkdir -p "$SCRIPTPATH/../backup"
	mv "$SCRIPTPATH/../main.cpp" "$SCRIPTPATH/../backup/main.cpp"

	cat > "$SCRIPTPATH/../main.cpp" << EOF
#include <bits/stdc++.h>
using namespace std;

int main() {
	freopen("input.txt", "r", stdin);
	ios::sync_with_stdio(false);
	cin.tie(NULL);

}

EOF
	
	# Clear input.txt
	> "$SCRIPTPATH/../input.txt"
	touch "$SCRIPTPATH/../input.txt"
}

setup
