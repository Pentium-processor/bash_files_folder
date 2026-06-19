#!/bin/bash
echo "PACKAGE NAME:"
read package_name

package=$(pip list  | grep -wi $package_name)
echo "$package
