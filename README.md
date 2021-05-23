# rileykav's dotifles

Typically stored in ~/.dotfiles, will have to edit to alow it to go anywhere?
For files ending with a "symlink" extension, you want to symlink from the home directory such that:

~/.zshrc ----> ~/.dotfiles/zsh/zshrc.symlink

I.e. each of these dotfiles in the home directory are symlinks putting to the this directory. Most other files that don't need to be on the home directory are stored as file.zsh ro file.vim etc.
To corretctly set up these links:

```zsh I'm a Code block
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc 
```
add find(symlinks)



![github-qrcode](git/github-qrcode.png)
