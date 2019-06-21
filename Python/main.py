from time import time
import sys
import bloodcomp

showTime = False

if len(sys.argv) == 3 and sys.argv[2] == "-t":
    showTime = True
    start = time()

bloodcomp.get_combinations(open(sys.argv[1], "r").read().split("\n"))

if showTime:
    print "\nTotal execution time:", (time() - start) * 1000, "milliseconds"
