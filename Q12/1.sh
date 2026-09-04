CMD="./test.sh"


TMP_OUT="stdout.tmp"
TMP_ERR="stderr.tmp"
FINAL_OUT="stdout.log"
FINAL_ERR="stderr.log"

count=0

while true; do
    ((count++))
    $CMD > "$TMP_OUT" 2> "$TMP_ERR"
    exit_code=$?

    if [ $exit_code -ne 0 ]; then
        mv "$TMP_OUT" "$FINAL_OUT"
        mv "$TMP_ERR" "$FINAL_ERR"

        
        echo "Times: $count  Exit code: $exit_code"
        echo "-------------------- stdout --------------------"
        cat "$FINAL_OUT"
        echo "-------------------- stderr --------------------"
        cat "$FINAL_ERR"
        echo "================================================="
        break
    fi
done
