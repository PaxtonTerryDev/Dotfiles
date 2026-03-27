#!/bin/bash

for arg in "$@"; do
  gh repo edit PaxtonTerryDev/${arg} --visibility private --accept-visibility-change-consequences
done
