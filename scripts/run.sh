#!/bin/bash
set -e

function run () {
	g++ -std=c++17 main.cpp -o main
	./main
	rm main
}

run
