find -O3 /trash -type f | while read file; do 
    a=$(($(stat -c %Z $file)+172800))
    r=$(($(date +%s) > $a))

    if (($r == 1)); then
        echo "remove $file"
        remove $file
    else
        echo "no remove $file"
    fi
done