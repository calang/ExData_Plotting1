#! /bin/bash

IN=household_power_consumption.txt
OUT=household_powerc_subset.txt

head -1 $IN >$OUT

grep -E '^[12]/2/2007' $IN >>$OUT

