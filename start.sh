tmux \
    new-session -d -s warehouse 'cd back_end && node app.js' \; \
    split-window 'cd front_end && npm start';
tmux a -t warehouse