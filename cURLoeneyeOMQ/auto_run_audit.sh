while true; do
    ./generate_uni_ima.sh
    git push origin main || git push origin master
    # Wait for 1 hour before the next automated verification crawl
    sleep 3600
done
