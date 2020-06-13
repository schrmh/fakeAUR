#!/bin/bash -i
#Developer: schrmh (schreibemirhalt@gmail.com) / derberg#7221 from Linux Gaming Discord
#Version: 2.1 - now with impossible piping
function show_help () {
    echo "fakeAUR 2.1 - now with impossible piping"
    echo "You pipe with your package helper (e.g yay) and provide a new package name and a new description:"
    echo "yay <package> | fakeAUR nani \"now you can speak japanese\""
    echo ""
    echo "use -btw without further parameters for a btwiusearch message or -nani for that nani message."
    echo "-grep will grep the original description of the piped package"
    echo "TODO: 1). switch between core/community/aur or custom with colour. Also version, size, orphanded, etc."
    echo "2) Manipulate multiple packages at once and list them just like a package helper would"
    echo "3) Copy a screnshoot to clipboard"
    echo "4) Fix formatted output for trizen.."
    echo "5) A config file that allows custom shortcuts that are like -btw or -nani"
    echo "6) Ignore shells that aren't bash too"
    echo "Try -debug if something is wrong with the output"
}

function process_search {
    processes=$(> >(ps -f))
    pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
    helper=$(echo $pac | cut -d' ' -f1)
    pac=$helper" "$(echo $pac | cut -d' ' -f2)
}

function get_data {
    description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
    name=$(echo ${pac} | grep -Eo "[^ ]+$")
}

function fake_data {
    [[ $helper != "bash" ]] && {
    echo ${PS1@P}$helper "$1"
    echo -ne '\n' | eval ${pac} --color=always | sed -e "s/$name/$1/" | sed -e "s/$description/$2/"
    }
}

if [ $# -eq 0 ] 
then
    show_help
    exit 1
fi

first="enabled"
for i in "$@"
    do 
        case $i in
            -h | --h | --help )
                show_help
                exit 1
            ;;
            -debug )
                processes=$(> >(ps -f))
                echo $processes
                echo "and now reduced"
                pac=$(echo $processes | grep -o -P "(?<=00:00:00).*(?=$USER)" | grep -o -P "(?<=00:00:00).*(?=00:00:00)")
                echo $pac
                pac=$(echo $pac | cut -d' ' -f1)" "$(echo $pac | cut -d' ' -f2)
                echo concat
                echo $pac
                echo concat end
                
               # if [[ $pac = *"00"* ]]; then
               #     delete=$(echo $pac | grep -oP "(?<=$USER\s)\w+")
               #     pac=$(echo $pac | grep -o -P '(?<=00:00:00).*(?=)')
               #     echo lol
               #     echo $pac
               #     echo rid off me
               #     echo $delete
               #     echo now
               #     kill -9 $delete
               # fi
               # echo $pac
            
                get_data
                fake_data "btwiusearch" "A very important and easy to use package to show the world that you run the best distro"
            ;;
            -btw )
                process_search
                get_data
                fake_data "btwiusearch" "A very important and easy to use package to show the world that you run the best distro"
            ;;
            -nani )
                process_search
                get_data
                fake_data "nani" "now you can speak japanese"
            ;;
            -grep)
                process_search
                description=$(echo -ne '\n' | eval "${pac}" | grep "    ")
                echo $description
            ;;
            *)
                if [[ $first = "enabled" ]]; then
                    first="disabled"
                    process_search
                    get_data
                    fake_data "$1" "$2"
                fi
            ;;
        esac
    done
exit 0
