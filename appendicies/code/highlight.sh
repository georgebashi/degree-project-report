#!/bin/sh
OLD_DIR=`pwd`
IN_PATH="/home/george/final_year_project/trunk/src"
OUT_PATH="/home/george/final_year_project/report/appendicies/code"

cd $IN_PATH

HIGHLIGHT_CMD="highlight --latex --fragment -W --style=nedit --style-outfile=highlight.sty"
$HIGHLIGHT_CMD -q --outdir=$OUT_PATH --batch-recursive='*.cc'
$HIGHLIGHT_CMD -q --outdir=$OUT_PATH --batch-recursive='*.hh'
$HIGHLIGHT_CMD -q --outdir=$OUT_PATH --batch-recursive='*.rb'
