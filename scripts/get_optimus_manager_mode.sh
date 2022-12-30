#!/usr/bin/env bash

optimus-manager --print-mode | awk '{print $NF}'
