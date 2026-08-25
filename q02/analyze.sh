if [ $# -ne 1 ]; then
    echo "Usage: $0 <csv_file>" >&2
    exit 1
fi

CSV_FILE="$1"

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' does not exist" >&2
    exit 1
fi

AVG_LATENCY=$(tail -n +2 "$CSV_FILE" | cut -d',' -f5 | awk '{sum+=$1; count++} END {if(count>0) printf "%.2f", sum/count; else print "0.00"}')

echo "=== Top 2 paths with most 5xx errors ==="
tail -n +2 "$CSV_FILE" | awk -F',' '$4 >= 500 && $4 < 600 {print $3}' | sort | uniq -c | sort -rn | awk '{print $2 " " $1}' | head -2

echo "=== Average latency ==="
echo "$AVG_LATENCY"
