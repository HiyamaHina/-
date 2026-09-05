#!/bin/bash

# 保存当前工作目录到变量 MARCO_DIR
marco() {
    export MARCO_DIR="$(pwd)"
    echo "Saved directory: $MARCO_DIR"
}

# 切换回保存的目录
polo() {
    if [ -n "$MARCO_DIR" ]; then
        cd "$MARCO_DIR" || echo "Failed to cd to $MARCO_DIR"
        echo "Now in: $(pwd)"
    else
        echo "Error: No directory saved. Run 'marco' first."
    fi
}