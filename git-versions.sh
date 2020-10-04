#!/usr/bin/bash
#Author: badal
which wget 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
  echo "please install git and retry"
  exit 1
fi

if [ -e "index.html" ]
then
  echo "Remove old index.html"
  rm -rf indwx.html
fi

url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
wget $url
if [ $? -ne 0 ]
then
  echo "Unable to download git info from $url"
  exit 2
fi

declare -a git_vers
echo "***************Please wait Collecting all git versions from official git site****************"
while read line
do
  git_vers=($(echo $line|sed -n '/git-\([0-9]\+\.\)\+tar.gz/p'|awk -F '"' '{print $2}'|cut -c 5-|awk -F '.tar.gz' '{print $1}'))
done < index.html

echo "The all available git-versions are: "
cnt=0
no_vers={#git_vers[*]}
WIDTH=20
for each_ver in ${git_vers[*]}
do
  printf "%-*s %-*s %-*s\n" $WIDTH ${git_vers[$cnt]} $WIDTH ${git_vers[$((cnt+1))]} $WIDTH ${git_vers[$((cnt+2))]} 
  cnt=$((cnt+3))
  if [ $cnt -ge $no_vers ]
  then
   break
  fi
done
