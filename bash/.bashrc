# ~/.bashrc (organized)
case $- in *i*) ;; *) return;; esac
BASHRC_D="$HOME/.bashrc.d"
if [ -d "$BASHRC_D" ]; then
  for f in "$BASHRC_D"/*.sh; do [ -r "$f" ] && . "$f"; done
fi
[ -r "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"
