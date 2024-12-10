#! /bin/zsh
rm -rf $HOME/backup/.*
mv -f $HOME/.zshrc $HOME/backup
ln -s $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
mv -f $HOME/.vimrc $HOME/backup
ln -s $HOME/.dotfiles/vim/vimrc.symlink $HOME/.vimrc
mv -f $HOME/.tmux.conf $HOME/backup
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf
ln -s "$HOME/Library/Mobile Documents/com~apple~CloudDocs" $HOME/iCloud


