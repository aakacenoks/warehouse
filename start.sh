tmux \
    new-session -d -s warehouse 'cd backend && node app.js' \; \
    split-window 'cd frontend && npm start';
tmux a -t warehouse