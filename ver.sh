#!/bin/bash

echo "PIP PACKAGE:"

read pip_package_name

echo "PACKAGE VERSION:$(pip3 list | rg -FN "$pip_package_name" | awk -F " " '{print $2}')"
