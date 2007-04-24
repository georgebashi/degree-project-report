#!/bin/sh
if [ -z $1 ]
then
	find . -name '*.tex' | grep -Ev "appendicies|formulae|front|testing/output|testing/user-testing" | xargs cat | grep -v "\item" > /tmp/wordcount
elif [ "$1" = "`pwd`/report.tex" ]
then
	find . -name '*.tex' | grep -Ev "appendicies|formulae|front|testing/output|testing/user-testing" | xargs cat | grep -v "\item" > /tmp/wordcount
else
	cat $1 | grep -v "\item" > /tmp/wordcount
fi

./TeXcount.pl -vvv -html /tmp/wordcount > wordcount.html
WORDS=`./TeXcount.pl /tmp/wordcount | grep "Words in text:" | cut -c 15-`
rm /tmp/wordcount

echo `svnversion .` `date "+%D %T"` $WORDS > front/version.tex
rubber -d report
