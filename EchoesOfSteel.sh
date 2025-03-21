#!/bin/sh
echo -ne '\033c\033]0;epicVeedeeoGaymu\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/EchoesOfSteel.x86_64" "$@"
