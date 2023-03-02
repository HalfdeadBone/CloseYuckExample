CFG=`pwd`
EWW=`which eww`
echo `${EWW} --config "$CFG" windows | tr -d '*'`
