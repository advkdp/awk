[adminuser@centos awk]$ cat aawk.awk 
BEGIN {
	print "=============working on file /etc/passwd================="
}
/root/ {print $0}

END {
	print "=============completed working on file /etc/passwd========="
}

=================================================================
[adminuser@centos awk]$ awk -f aawk.awk /etc/passwd
=============working on file /etc/passwd=================
root:x:0:0:root:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
=============completed working on file /etc/passwd=========
[adminuser@centos awk]$
