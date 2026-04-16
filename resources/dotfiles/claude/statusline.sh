#!/usr/bin/env bash

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

short_cwd="${cwd/#$HOME/\~}"

git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" -c core.fsmonitor=false symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && git_branch=" ($branch)"
fi

ctx_info=""
if [ -n "$used" ] && [ "$used" != "null" ]; then
    ctx_info=" ctx:$(printf '%.0f' "$used")%"
fi

printf "\033[34m%s\033[0m\033[33m%s\033[0m \033[36m[%s%s]\033[0m" \
    "$short_cwd" "$git_branch" "$model" "$ctx_info"
