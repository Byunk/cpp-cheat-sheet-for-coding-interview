#!/bin/bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

function setup () {
	cat > "$SCRIPTPATH/../main.cpp" << EOF
#include <iostream>
#include <vector>
	
using namespace std;

void solve() {

}

int main() {
	freopen("input.txt", "r", stdin);
	solve();
}

EOF
	
	# Clear input.txt
	> "$SCRIPTPATH/../input.txt"
	touch "$SCRIPTPATH/../input.txt"
}

setup
