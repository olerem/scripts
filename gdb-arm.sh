#!/bin/bash

ELF_PATH="$1"
CFG_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Provide a way to overwrite default gdb path
if [ -f "$CFG_PATH"/config.sh ]; then
	source "$CFG_PATH/config.sh"
else
	GDB="gdb"
fi

"$GDB" -nx -iex "set auto-load safe-path /" -ex "source "$CFG_PATH"/gdb-openocd-base.ini" \
	-ex "source "$CFG_PATH"/gdb-openocd-smp.ini" \
	"$ELF_PATH"
