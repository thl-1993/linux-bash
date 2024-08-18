# 1
# белый основной \033[97m 
# белый фон \033[107m

# 2
# красный основной \033[91m	
# красный фон \033[101m

# 3
# зелёный основной \033[92m	
# зелёный фон \033[101m

# 4
# голубой основной \033[96m	
# голубой фон \033[106m

# 5
# пурпурный основной \033[95m	
# пурпурный фон \033[105m

# 6
# чёрный основной \033[30m	
# чёрный фон \033[40m

NORMAL='\033[0m'      #  ${NORMAL}    # все атрибуты по умолчанию

# Цвет текста:
WHITE='\033[0;37m'       #  ${GRAY}      # серый цвет знаков
RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
GREEN='\033[0;32m'     #  ${GREEN}    # зелёный цвет знаков
BLUE='\033[0;34m'       #  ${BLUE}      # синий цвет знаков
MAGENTA='\033[0;35m'     #  ${MAGENTA}    # фиолетовый цвет знаков
BLACK='\033[0;30m'     #  ${BLACK}    # чёрный цвет знаков


# Цвет фона
BGWHITE='\033[47m'     #  ${BGGRAY}
BGRED='\033[41m'       #  ${BGRED}
BGGREEN='\033[42m'     #  ${BGGREEN}
BGBLUE='\033[44m'     #  ${BGBLUE}
BGMAGENTA='\033[45m'     #  ${BGMAGENTA}
BGBLACK='\033[40m'     #  ${BGBLACK}

#tput sgr0     # Возврат цвета в "нормальное" состояние
#-n     do not output the trailing newline
#-e     enable interpretation of backslash escapes


if [ $2 == 1 ]; then
    echo -en $WHITE
elif [ $2 == 2 ]; then
    echo -en $RED
elif [ $2 == 3 ]; then
    echo -en $GREEN
elif [ $2 == 4 ]; then
    echo -en $BLUE
elif [ $2 == 5 ]; then
    echo -en $MAGENTA
elif [ $2 == 6 ]; then
    echo -en $BLACK
fi

if [ $1 == 0 ]; then
    echo -en $NORMAL 
    tput sgr0
elif [ $1 == 1 ]; then
    echo -en $BGWHITE
elif [ $1 == 2 ]; then
    echo -en $BGRED
elif [ $1 == 3 ]; then
    echo -en $BGGREEN
elif [ $1 == 4 ]; then
    echo -en $BGBLUE
elif [ $1 == 5 ]; then
    echo -en $BGMAGENTA
elif [ $1 == 6 ]; then
    echo -en $BGBLACK
fi
