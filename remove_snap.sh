#!/bin/bash

remove_snap_revisions(){
    echo "Starting snap cleaning process..."

    # get list of installed snaps 
    snaps=$(snap list --all | awk '!/disabled/{print $1}' | sort -u)

    if [ -z "$snaps" ]; then
        echo "No snaps found on the system"
        return
    fi

    removed_count=0

    for snap in $snaps; do 
        # get the revisions for each snap, sorted by revision number 
        revisions=$(snap list --all "$snap" | awk '/disabled/{print $3}' | sort -n)

        # count the number of revisions 
        revision_count=$(echo "$revisions" | wc -l)

        # if there's more than one revision, remove the oldest (lowest number)
        if [ "$revision_count" -gt 1 ]; then
            oldest_revision=$(echo "$revisions" | head -n1)
            echo "Removing oldest revision $oldest_revision of $snap"
            if sudo snap remove "$snap" --revision="$oldest_revision of $snap"; then
                removed_count=$((removed_count + 1))
            else
                echo "Failed to remove revision $oldest_revision of $snap"
            fi
        fi
    done

    if [ $removed_count -eq 0 ]; then
        echo "No old revisions found to clean up"
    else
        echo "Cleanup complete Removed old revisions from $remove_count snap(s)."
    fi
}

