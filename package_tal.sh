#!/usr/bin/env bash
function usage
{
    echo '
usage: tal [args]
args:
 a -Sets js, commit, docs to true.

 d - Generates html documentation in the /doc directory.
 j - Generates minified javascript as all.min.js.gz in javascript subdirs.
 c - Commits to github, prompts for a commit message.
 h - Print this help.
 
'
    return 1
}
#args
doc=0;
js=0;
commit=0;
help=0;
all=0;
num=$#;
while [ $# -gt 0 ]
do
    case "$1" in
        #(-h) host="$2"; shift;; [Syntax for named options]
        (-d) doc=1;;
        (-j) js=1;;
	(-c) commit=1;;
	(-a) all=1;;
	(-h) help=1;;
        (-*) echo "$0: error - unrecognized option $1" 1>&2; echo "`usage`"; exit 1;;
        (*)  break;;
    esac
    shift
done

#no args.
if [ $num -lt 1 ]
then 
    echo "`usage`"; 
    exit 1; 
fi;

#do everything.
if [ $all -gt 0 ]
then
    js=1; doc=1; commit=1;
fi

#just show help.
if [ $help -gt 0 ]
then
    echo "`usage`";
    exit 0
fi


if [ $doc -gt 0 ]
then
    cd $EVREPO/public/js
    
fi

if [ $js -gt 0 ]
then
    cd $EVREPO/public/utils
    ./imports.py
fi

if [ $commit -gt 0 ]
then
    cd $EVREPO
    git add .
    read -p "commit message:" message
    git commit -m "$message" -a
    git push
fi
