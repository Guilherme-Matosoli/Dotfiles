set -e

echo "================================"
echo " Installing NodeJS"
echo "================================"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
export NVM_DIR="$HOME/.nvm"
\. "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts

echo "================================"
echo " Installing Neovim"
echo "================================"
if [ "$(uname)" = "Darwin" ]; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-macos-arm64.tar.gz
  tar -xzf nvim-macos-arm64.tar.gz
  sudo mv nvim-macos-arm64 /opt/nvim
  sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
  rm nvim-macos-arm64.tar.gz
else
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  tar -xzf nvim-linux-x86_64.tar.gz
  sudo mv nvim-linux-x86_64 /opt/nvim
  sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
  rm nvim-linux-x86_64.tar.gz
fi

mkdir -p ~/.config/nvim
git clone git@github.com:Guilherme-Matosoli/vimconfig.git ~/.config/nvim

echo "================================"
echo " Installing Iosevka font"
echo "================================"
curl -Lo ~/Downloads/iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Iosevka.zip

if [ "$(uname)" = "Darwin" ]; then
  unzip ~/Downloads/iosevka.zip -d ~/Library/Fonts/
else
  mkdir -p ~/.local/share/fonts
  unzip ~/Downloads/iosevka.zip -d ~/.local/share/fonts/
  fc-cache -fv
fi
