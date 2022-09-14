#! /usr/bin/bash

make main

echo ""
echo ""
echo "Running main benchmark"

set -x
for i in {1,2,4,8}
do
  ./main 24 $i
done

make clean
