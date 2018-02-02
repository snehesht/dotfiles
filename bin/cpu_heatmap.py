#!/usr/bin/python3
from subprocess import Popen, PIPE
import sys,os
#heatmap_colors = ['colour118','colour226','colour208','colour202','colour196']
heatmap_colors = ['colour010','colour011','colour009']

tick = u'\u2589'
CPU_COUNT = os.cpu_count()
TOP_REPEAT=5
TOP_DELAY=0.02

def collect_cpu_stats():
    cmd = ['top','-bn','1']
    proc = Popen(cmd,stdout=PIPE, stderr=PIPE)
    out,err = proc.communicate()
    output = []
    output = out.decode().split('\n')
    cpu_info = output[2:2+CPU_COUNT]

    cpu_usage = {}
    for i in range(CPU_COUNT):
        cpu_usage[i] = cpu_info[i].split()[2].split('/')[0]
    return cpu_usage

def collect_cpu_stats_avg():
    cmd = ['top','-bn',str(TOP_REPEAT),'-d',str(TOP_DELAY)]
    proc = Popen(cmd,stdout=PIPE,stderr=PIPE)
    out,err = proc.communicate()
    output = out.decode().split('\n')

    # append lines that start with %Cpu
    cpu_info = []
    for line in output:
        if line[:4] == "%Cpu":
            cpu_info.append([line.split()[0],line.split()[2]])

    # Clean cpu info
    cpu_usage={}
    for line in cpu_info:
        # see if cpu key exits in usage, if not add it.
        line[0] = int(line[0].replace('%Cpu',''))
        line[1] = float(line[1].split('/')[0])

        # add usage percentage for a cpu accross repeats
        if cpu_usage.get(line[0],None) != None:
            cpu_usage[line[0]] = cpu_usage[line[0]] + line[1]
        else:
            # ignoring the initial stats
            # cpu_usage[line[0]] = line[1]
            cpu_usage[line[0]] = 0
    # Now average all the added values
    for key,val in cpu_usage.items():
        cpu_usage[key] = int(val/TOP_REPEAT)

    # return averaged values
    #print(cpu_usage)
    return cpu_usage

def process_cpu_stats():
    raw_cpu_stats = collect_cpu_stats_avg()
    color_output = ""
    for key,val in raw_cpu_stats.items():
        status_color = ''
        val = float(val)
        # print(val)
        if int(val) < 30:
            status_color = heatmap_colors[0]
        elif int(val) > 30 and int(val) < 70:
            status_color = heatmap_colors[1]
        elif int(val) > 70 and int(val) < 100:
            status_color = heatmap_colors[2]
        else:
            status_color = heatmap_colors[2]

        color_output = color_output + '#[fg='+status_color+',bg=colour236]'+tick
    print(color_output + '#[default]')



def test():
    elm = "CPU's "
    # elm =u"\U0001F4BB"
    for i in heatmap_colors:
        elm = elm + '#[fg=' + i + ',bg=colour236]' + u'\u2589'

    elm = elm + '#[default]'
    print(elm)


def main():
    process_cpu_stats()


if __name__=="__main__":
    if len(sys.argv)>1:
        collect_cpu_stats_avg()
    else:
        main()
