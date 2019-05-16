#!/usr/bin/env python

import sys
import re

current_number = 0

for line in sys.stdin.readlines():
    if re.match("^client", line):
        id = line.split()[1].replace(':','')
        if id == '0': continue

        if id == sys.argv[1]:
            print(current_number)
            exit()
        current_number += 1
    elif id != '0' and re.match("^    [1-9]", line):
        current_number += 1
