function wait() {
    echo -n "-------------------------- Press any key to continue -------------------------- "
    read any_old_char
}

function check_command() {
    echo -n "💲 $* "
    $* > /tmp/out && echo " ✅" || (echo " ❌"; exit 1)
    cat /tmp/out
}

function check_long_command() {
    echo "💲 $* "
    $* 
}

function all_good() {
    echo 
    echo "                         🎉 All good, let's continue 🎉"
    echo
}