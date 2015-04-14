# Benjamin Kalman is the author of this function.
# Taken from https://github.com/kalman/rc/blob/master/profile#L60
function vl() {
  file=`echo "$1" | cut -d: -f1`
  line=`echo "$1" | cut -d: -f2`
  v "$file" +"$line"
}
