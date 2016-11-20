#!/usr/bin/python3

import psutil
import argparse

XTERM_COLORS={'red':'colour009','green':'colour010','white':'colour231','black':'colour236','yellow':'colour011'}
TICK = u"\u2589"

def loadavg():
    cpu_load = ""
    with open('/proc/loadavg','r') as fp:
        for item in fp.read().strip().split()[0:3]:
            cpu_load = cpu_load + item + " "
    return cpu_load

def cpu_usage():
    # enable interval=1 if samples need to be taken for long time
    cpu_usage = psutil.cpu_percent(percpu=True, interval=0.2)
    return cpu_usage

def mem_usage():
    mem_usage = psutil.virtual_memory()
    return mem_usage.percent

def print_cpu_usage(args):
    cpu_stats = cpu_usage()
    cpu_stat = ""

    for cpu in cpu_stats:
        if cpu < 40.0:
            cpu_stat = cpu_stat + color_formatter('green',TICK,args)
        elif cpu > 40.0 and cpu < 70.0:
            cpu_stat = cpu_stat + color_formatter('yellow',TICK,args)
        elif cpu > 70.0:
            cpu_stat = cpu_stat + color_formatter('red',TICK,args)

    return cpu_stat

def print_mem_usage(args):
    mem_stats = mem_usage()

    if mem_stats%10.0 < 5.0:
        active_bars = mem_stats/10.0
    else:
        active_bars = (mem_stats/10.0) + 1.0

    used_mem = TICK*int(active_bars)
    free_mem = TICK*(10 - int(active_bars))

    total_mem = ""

    if mem_stats < 40.0:
        total_mem = color_formatter('green', used_mem, args)
    elif mem_stats < 70.0:
        total_mem = color_formatter('yellow', used_mem, args)
    else:
        total_mem = color_formatter('red', used_mem, args)

    total_mem = total_mem + color_formatter('white', free_mem, args)
    return total_mem

def color_formatter(color,data,args):
    if args.tmux:
        tmux_format = "#[bg={0},fg={1}]{2}#[bg=default,fg=default]".format(XTERM_COLORS['black'],XTERM_COLORS[color], data)
        return tmux_format


def main(args):
    usage = ""

    if args.cpu:
        usage = usage + print_cpu_usage(args)

    if args.mem:
        usage = usage + print_mem_usage(args)

    if args.load:
        usage = loadavg()
    print(usage)

if __name__=="__main__":

    parser = argparse.ArgumentParser()

    parser.add_argument('--tmux', help='prints output in tmux format', action='store_true')
    parser.add_argument('--cpu', help='print cpu usage', action='store_true')
    parser.add_argument('--mem', help='print memory usage', action='store_true')
    parser.add_argument('--load', help='print system load', action='store_true')

    args = parser.parse_args()
    main(args)

