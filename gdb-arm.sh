#!/bin/bash

ELF_PATH="$1"
CFG_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

~/tmp/gdb-7.9/gdb/gdb -nx -ex "source "$CFG_PATH"/gdb-openocd-base.ini" \
	-ex "source "$CFG_PATH"/gdb-openocd-smp.ini" \
	"$ELF_PATH"
