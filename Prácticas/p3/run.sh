#!/bin/bash
flex p3.lex;
gcc lex.yy.c -o prog -lfl;
./prog < input.txt > output.txt
