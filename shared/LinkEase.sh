#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="LinkEase"
#QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`
#APACHE_ROOT=`/sbin/getcfg SHARE_DEF defWeb -d Qweb -f /etc/config/def_share.info`
export QNAP_QPKG=$QPKG_NAME

function create_env()
{
    #/share/CACHEDEV1_DATA/.qpkg
    PACKAGE_DIR=`/sbin/getcfg "${QPKG_NAME}" Install_Path -d "" -f ${CONF}`
    #/share/CACHEDEV1_DATA/Public
    PUBLIC_DIR=`getcfg -f /etc/config/smb.conf Public path`
    #setsid nohup  disown
    #(subshell &)
    CUR=`pwd`
    cd $PACKAGE_DIR
    ./easy-explorer -share $PUBLIC_DIR & disown
    cd $CUR
}

case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
        echo "$QPKG_NAME is disabled."
        exit 1
    fi
    create_env
    ;;

  stop)
    killall easy-explorer
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
