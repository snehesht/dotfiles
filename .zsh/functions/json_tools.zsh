# Pretty Print json
#
alias pp_json="python -c 'import sys;import json;print(json.dumps(json.loads(sys.stdin.readlines()[0]), indent=4, sort_keys=True));'"
