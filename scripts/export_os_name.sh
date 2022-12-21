#!/bin/bash

uname_result="$(uname -s)"

case "${uname_result}" in
    Linux*)     os_name=linux;;
    Darwin*)    os_name=mac;;
    CYGWIN*)    os_name=cygwin;;
    MINGW*)     os_name=mingw;;
    *)          os_name="UNKNOWN:${unameOut}"
esac

export OS_NAME=$os_name
