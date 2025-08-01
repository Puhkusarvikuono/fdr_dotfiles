#!/bin/bash

if nmcli connection show cormorant &> /dev/null; then
  echo "True"
else
  echo "False"
fi
