CURRAM=$(top -l 1 -s 0 | awk '/PhysMem/{print}' | awk '{print $6}' | cut -d 'M' -f 1)
echo $(perl -MTime::HiRes=time -e 'printf "%.9f\n", time') $CURRAM
