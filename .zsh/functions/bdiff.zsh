function bdiff() {
    if [ $# != 2 ]; then
        echo "Usage:"
        echo "$0 FILE_1 FILE_2"
    else
        cmp -l $1 $2 | gawk '{printf "%08X %02X %02X\n", $1, strtonum(0$2), strtonum(0$3)}'
    fi
}
