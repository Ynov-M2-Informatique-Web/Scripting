a=$(($(stat -c %Z /trash/u.1667556237)+172800))
r=$(($(date +%s) > $a))

if [$r == 1]; then;
    echo "true"
else
    echo "false"
fi