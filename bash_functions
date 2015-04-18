# Benjamin Kalman is the author of this function.
# Taken from https://github.com/kalman/rc/blob/master/profile#L60
function vl() {
  file=`echo "$1" | cut -d: -f1`
  line=`echo "$1" | cut -d: -f2`
  vim "$file" +"$line"
}

function mylocalip() {
  /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}';
}
