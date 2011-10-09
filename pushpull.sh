#/usr/bin/env bash

dosh
expect -c 'spawn ssh tin; expect "~ >"; send ish\n; expect "~ >"; send doll\n; expect "~ >"; send logout\n; expect "~ >"; send logout\n;  interact'