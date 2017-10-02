#bin/bash
ip=$(kubectl describe service nexus | grep "Endpoints:")
tmp=${ip%:*}
ip=${tmp#*:}
echo $ip
match='least_conn;'
file='conf-map.yaml'
sed -i "s/$match/$match\n            server$ip;\n/" $file
