Res='\e[0m'
Red='\e[0;31m'
Gre='\e[0;32m'
Yel='\e[0;33m'
Blu='\e[0;34m'
Bold='\e[1;39m'

function log_error() {
    format="[$(date --iso-8601=seconds)][${Red}ERROR${Res}]\t"
    if (( $# == 0 )) ; then
        echo -e "$format$(cat /dev/stdin)"
    else
        echo -e "$format$1"
    fi
}

function log_action() {
    format="[$(date --iso-8601=seconds)][${Gre}ACTION${Res}]\t"
    if (( $# == 0 )) ; then
        echo -e "$format$(cat /dev/stdin)"
    else
        echo -e "$format$1"
    fi
}

function log_warning() {
    format="[$(date --iso-8601=seconds)][${Yel}WARNING${Res}]\t"
    if (( $# == 0 )) ; then
        echo -e "$format$(cat /dev/stdin)"
    else
        echo -e "$format$1"
    fi
}

function log_notice() {
    format="[$(date --iso-8601=seconds)][${Blu}NOTICE${Res}]\t"
    if (( $# == 0 )) ; then
        echo -e "$format$(cat /dev/stdin)"
    else
        echo -e "$format$1"
    fi
}


echo "Error while checking platform database logs" | log_error
echo "Error while checking platform database logs" | log_action
echo "Error while checking platform database logs" | log_warning
echo "Error while checking platform database logs" | log_notice

log_error "Error while checking platform database logs"
log_action "Error while checking platform database logs"
log_warning "Error while checking platform database logs"
log_notice "Error while checking platform database logs"