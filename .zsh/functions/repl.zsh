#!/bin/bash
  
function repl(){
    printf "REPL for %s\n" "$@"
  
    notblank()
    {    
	[ $# -gt 0 ]
    }
  
    while true ; do
    	printf "%s> " "$@"
	read -r || break;
	notblank $REPLY || continue;
	eval command \"\$@\" "$REPLY"
    done
}
