#!/bin/sh
parent_pid=$PPID
#Developer: @derberg:matrix.org
#Version: 3 - Done right
show_help () {
    echo "fakeAUR 3 - Done right"
    echo "You pipe with your package helper (e.g paru) and provide a new package name and a new description:"
    echo "paru <package> | fakeAUR nani \"now you can speak japanese\""
    echo ""
    echo "use -btw without further parameters for a btwiusearch message or -nani for that nani message."
    echo "-grep will print the original description of the piped package"
    echo "TODO:"
    echo "1). switch between core/community/aur or custom with colour. Also version, size, orphanded, etc."
    echo "2) Manipulate multiple packages at once and list them just like a package helper would"
    echo "3) Copy a screenshoot to clipboard"
    echo "4) Fix formatted output for trizen.."
    echo "5) A config file that allows custom shortcuts that are like -btw or -nani"
    echo "Try -debug if something is wrong with the output"
}

get_data () {
pac="$(tr '\0' ' ' </proc/$(cat /proc/$parent_pid/task/$parent_pid/children | cut -d' ' -f1)/cmdline)"
    local package=$(echo "$pac" | cut -d' ' -f2)
    query=$(printf %s "$package" | jq -s -R -r @uri) #urlencode
    results=$(curl -s "https://aur.archlinux.org/rpc/?v=5&type=search&arg=$query" | jq -r '.results')
    if [ "$results" = "[]" ]; then
        echo "No results found for '$package'"
        exit
    else
        name=$(echo "$results" | jq -r '.[] | "\(.Name)"')
        description=$(echo "$results" | jq -r '.[] | "\(.Description)"')
    fi
}

fake_data () {
    printf '\n' | eval "$pac" --color=always | sed -e "s/$name/$1/" | sed -e "s/$description/$2/"
}

if [ $# -ne 1 ]
then
    if [ $# -eq 2 ] 
    then
        get_data
        fake_data "$1" "$2"
    else
        show_help
        exit 1
    fi
else
    if [ ! -p /dev/stdin ]; then
        echo "You did not pipe a command. Read the help!"
        show_help
        exit 1
    else
        case $1 in
            -debug )
                if [ -p /dev/stdin ]; then
                    echo "You piped something to this script!"
                    echo "Some output of the command you piped:"
                    read input
                    echo "$input"
                    echo "That was all."
                    pipe=true
                else
                    echo "No input piped to script."
                fi
                echo "NOTE: If you pipe the echo command into this script, you get wrong info"
                echo "This script is a child of PID "$parent_pid": $(tr '\0' ' ' </proc/$parent_pid/cmdline)"
                children="$(cat /proc/$parent_pid/task/$parent_pid/children)"
                echo "All childs of this: $children"
                echo "Check with this process table:"
                ps -f
                parent_tty="$(ps -o tty= -p $parent_pid)"
                echo "tty of the parent should be: $parent_tty"
                echo "Based on this, check this process tree:"
                ps f | grep "$parent_tty"
                wanted_pid=$(echo $children | cut -d' ' -f1)
                echo "This is the cmdline for PID $wanted_pid ("$([ -z "$pipe" ] && echo "this script):" || echo "before the pipe | ):")
                cmdline="$(tr '\0' ' ' </proc/$wanted_pid/cmdline)"
                echo "$cmdline"
                echo "Use this outside of a script (might lock your pacman db.lck, add killing code if so):" 
                echo "$cmdline | tr '\0' ' ' </proc/\$(cat /proc/\$$/task/\$$/children | rev | cut -d' ' -f3 | rev)/cmdline"
                echo ""
                echo "I will kill $wanted_pid now. You might still see some output:"
                sleep 0.1
                kill -9 "$wanted_pid"
                echo ""
                echo "Script is done."
            ;;
            -btw )
                get_data
                fake_data "btwiusearch" "A very important and easy to use package to show the world that you run the best distro"
            ;;
            -nani )
                get_data
                fake_data "nani" "now you can speak japanese"
            ;;
            -grep )
                get_data
                echo $description
            ;;
            *)
                show_help
                exit 1
            ;;
        esac
    fi
fi
exit 0
