#!/bin/bash

for arg in "$@"; do
  gh repo delete PaxtonTerryDev/${arg} --yes
done
