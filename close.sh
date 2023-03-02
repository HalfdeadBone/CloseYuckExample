#!/bin/bash
CFG="."
EWW=`which eww`
${EWW} --config "$CFG" close $@