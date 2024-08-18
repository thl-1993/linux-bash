#!/bin/bash
START=$(date +%s.%N)

   cd $1


#1 Общее число папок, включая вложенные
    echo "Total number of folders (including all nested ones) =" `sudo ls -R -r -l | grep ^d | wc -l`

#2 Топ 5 папок с самым большим весом в порядке убывания (путь и размер)
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"  
    sudo du $1 -h | sort -hr | head -5 | awk '{print "-",$2,",", $1}' |nl  

#3 Общее число файлов
    echo "Total number of files =" `sudo find $1 -type f | wc -l`
    
#4 Число конфигурационных файлов (с расширением .conf), текстовых файлов, исполняемых файлов, логов (файлов с расширением .log), архивов, символических ссылок
    echo "Number of:"
    echo "Configuration files (with the .conf extension) =" `sudo find $1 -name "*.conf" | wc -l`
    echo "Text files = " `sudo find $1 -name "*.txt" | wc -l`
    echo "Executable files = " `sudo find $1 -type f -executable | wc -l`
    echo "Log files (with the extension .log) = " `sudo find $1 -name "*.log" | wc -l`
    echo "Archive files = " `sudo find $1 -name '*.tar' -o -name '*.zip' -o -name '*.7z' -o -name '*.rar' -o -name '*.gz'| wc -l`
    echo "Symbolic links = " `sudo find $1 -type l | wc -l`

#5 Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

    array=(`find $1 -type f -exec du -h {} + | sort -hr | head -10 | awk '{print $2}'`)

    for fullpath in ${array[*]}
    do
        count=$(( $count + 1 ))
        filename="${fullpath##*/}"                      # Strip longest match of */ from start
        dir="${fullpath:0:${#fullpath} - ${#filename}}" # Substring from 0 thru pos of filename
        base="${filename%.[^.]*}"                       # Strip shortest match of . plus at least one non-dot char from end
        ext="${filename:${#base} + 1}"                  # Substring from len of base thru end
        if [[ -z "$base" && -n "$ext" ]]; then          # If we have an extension and no base, it really the base
            base=".$ext"
            ext=""
        fi
        echo "     $count  - "`find $fullpath -type f -exec du -h {} + | awk '{printf "%s, %s", $2, $1}'` ", $ext "  
    done

#6 Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)" 
    array=(`find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}'`)
    count=0
    for fullpath in ${array[*]}
    do
        count=$(( $count + 1 ))
        echo "     $count  - "`find $fullpath -type f -exec du -h {} + | awk '{printf "%s, %s", $2, $1}'` `md5sum $fullpath | awk '{print $1}'`  
    done

#7 Время выполнения скрипта
    END=$(date +%s.%N)
    echo "Script execution time (in seconds) = " `echo "$END $START" | awk '{printf "%.3lf", $1-$2}'`


