#!/bin/bash

ELF_PATH="$1"
CFG_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -f "$CFG_PATH"/config.sh ]; then
	source "$CFG_PATH/config.sh"
else
	GDB="gdb"
fi

"$GDB" -nx -ex "source "$CFG_PATH"/gdb-openocd-base.ini" \
	-ex "source "$CFG_PATH"/gdb-openocd-smp.ini" \
	"$ELF_PATH"
