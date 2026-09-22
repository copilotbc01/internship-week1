#!/usr/bin/env bash

FORBIDDEN_PATTERNS=("PRIVATE_KEY" "SUPABASE_SERVICE_ROLE_KEY" "AWS_SECRET_ACCESS_KEY")

for pattern in "${FORBIDDEN_PATTERNS[@]}"; do
    if git diff --cached | grep -E "$pattern" > /dev/null 2>&1; then
        echo "[ERROR] Commit blocked: sensitive key detected ($pattern)"
        echo "Keep this value in .env and make sure .env is in .gitignore."
        exit 1
    fi
done

exit 0
