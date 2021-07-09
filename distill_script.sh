#!/bin/bash
shopt -s globstar
shopt -s nullglob

# Print header into results CSV file
echo "filename, change, change_level, level_name, change_start_byte, change_end_byte, line_number, commit_1, commit_2, change_content" > distill_results.csv

# Set first commit as base commit
PREVIOUS_COMMIT=$(git rev-list "$1" --max-count 1 --no-merges --since "$3")

# Iterate over the commits in order, discarding merge commits, since the date provided. Skip the first commit as we already have it.
for COMMIT in $(git rev-list "$1" --max-count "$2" --no-merges --since "$3" --skip 1)
do
    # Generate changed file list between commit A and commit B
    git diff --name-only "$PREVIOUS_COMMIT" "$COMMIT" | grep "\.java" > temp
    
    # Read the filenames of the files that changed and copy them to use change distiller
    while read file; do
        
        git checkout -q "$PREVIOUS_COMMIT" > /dev/null
        
        # Copy file to a temporary file
        if [ -f "$file" ]; then
            cp "$file" "$file.A"
        fi
        
        git checkout -q "$COMMIT" > /dev/null
        
        # Copy file to a temporary file
        if [ -f "$file" ]; then
            cp "$file" "$file.B"
        fi
        
        # Only if both files exists perform the distilling and append results to CSV file
        if [[ -f "$file.A" && -f "$file.B" ]]; then
            java -jar pair_distiller.jar -a "$file.A" -b "$file.B" -c1 "$PREVIOUS_COMMIT" -c2 "$COMMIT" >> distill_results.csv
        fi
        
    done < temp
    
    PREVIOUS_COMMIT=$COMMIT
    
done
exit 0

