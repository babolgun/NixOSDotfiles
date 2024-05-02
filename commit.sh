#!/bin/sh

read -p "Enter your comment for commit: " comment
git commit -am "$comment"
