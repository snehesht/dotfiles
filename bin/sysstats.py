import argparse

import terminal_colors as colors

# UI elements
# \u2589

tick = u"\u2589"

MEM_BAR_LEN = 10

def main(args):
    memstats(args)


# colorize the memstats
# prints [||||||||]
# flow
# memstats --> process_memstats --> read_memstats
#
# For now hardcoded to 10 ticks, change it with MEM_BAR_LEN
def memstats(args):
    tmp_memstats = process_memstats()

    # Approximate the free memory in TICK
    # < 0.3 ~ Number
    # > 0.3 ~ Number + 1
    if tmp_memstats['available']%10 > 3.0:
        free = tick*(int(tmp_memstats['available']/10))
    else:
        free = tick*(int(tmp_memstats['available']/10) + 1)

    used = tick*(10-len(free))

    # For Normal terminal
    if args.i3:
        if(len(used)>7):
            print(colors.red(used)+colors.white(free))
        elif(len(used)<8 and len(used)>5):
            print(colors.yellow(used)+colors.white(free))
        else:
            print(colors.green(used)+colors.white(free))


    # For Tmux
    if args.tmux:
        # green
        if(len(used)>7):
            print('#[bg=colour236,fg=colour009]'+used+'#[fg=default,bg=default]#[bg=colour236,fg=colour231]'+free)
        # yellow
        elif(len(used)<8 and len(used)>5):
            print('#[bg=colour236,fg=colour011]'+used+'#[fg=default,bg=default]#[bg=colour236,fg=colour231]'+free)
        # red
        else:
            print('#[bg=colour236,fg=colour010]'+used+'#[fg=default,bg=default]#[bg=colour236,fg=colour231]'+free)

    return None

# Convert the raw stats to percentages
def process_memstats():

    raw_stats = read_memstats()

    # requires only few fields like MemTotal, MemFree, MemAvailable etc.
    mem_total = raw_stats.get('MemTotal', None)
    mem_free = raw_stats.get('MemFree', None)
    mem_available = raw_stats.get('MemAvailable', None)

    memstats_percentages = {}

    # Convert values to percentages
    memstats_percentages['total'] = 100
    memstats_percentages['free'] = (mem_free/mem_total) * 100
    memstats_percentages['available'] = (mem_available/mem_total) * 100

    return memstats_percentages


# Returns dict of /proc/meminfo
# all values in the dict are in kB
def read_memstats():

    meminfo_dict = {}

    # Read /proc/meminfo for memory usage stats
    with open('/proc/meminfo') as fp:
        raw_meminfo = fp.readlines()

    # Important fields among meminfo
    # MemTotal
    # MemFree
    # MemAvailable
    for line in raw_meminfo:
        #split eachline into substrings
        sub_line = line.split()
        sub_line[0] = sub_line[0].replace(':','')

        # add name (eg. MemTotal ) as key and number as value
        meminfo_dict[sub_line[0]] = int(sub_line[1])

    return meminfo_dict


# Starts here
if __name__=="__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--tmux',help="Color output for Tmux",action="store_true")
    parser.add_argument('--i3',help="Color output for i3bar", action="store_true")
    args = parser.parse_args()
    main(args)
