#!/bin/sh

echo `svnversion .` `date "+%D %T"` > front/version.tex
rubber -d report
