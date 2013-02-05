#!/usr/bin/env python
with open('_build/html/search.html') as f: lines = f.readlines()
mark = -1
for i,e in enumerate(lines):
    if "searchindex.js" in e and not 'src="searchindex' in e:  mark = i;

if(mark == -1):exit(0)
newline = '<script type="text/javascript" src="searchindex.js"></script>\n'
lines = lines[:mark-1] +[newline] + lines[mark+2:]
with(open('_build/html/search.html','w')) as f: f.write(''.join(lines))
exit(0)
