#!/bin/bash

gh repo edit PaxtonTerryDev/$1 --visibility ${2:-"private"} --accept-visibility-change-consequences
