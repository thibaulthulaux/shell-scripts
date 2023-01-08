#!/usr/bin/env bash
#
# Install Visual Studio Code and a set of extensions.
#

EXTENSIONS=(
  # Intellicode AI-assisted development ----------------------------------------
  visualstudioexptteam.vscodeintellicode
  # visualstudioexptteam.intellicode-api-usage-examples # dep

  # Shell ----------------------------------------------------------------------
  timonwong.shellcheck
  tetradresearch.vscode-h2o # Shell command completion

  # Git -----------------------------------------------------------------------
  mhutchie.git-graph
  eamodio.gitlens

  # Markdown -------------------------------------------------------------------
  DavidAnson.vscode-markdownlint
  yzhang.markdown-all-in-one
  pharndt.vscode-markdown-table

  # Prettier -------------------------------------------------------------------
  esbenp.prettier-vscode

  # Python ---------------------------------------------------------------------
  ms-python.python
  njpwerner.autodocstring
  # ms-python.isort
  # ms-python.vscode-pylance
  # ms-toolsai.jupyter
  # ms-toolsai.jupyter-keymap
  # ms-toolsai.jupyter-renderers
  # ms-toolsai.vscode-jupyter-cell-tags
  # ms-toolsai.vscode-jupyter-slideshow

  # Vim ------------------------------------------------------------------------
  vscodevim.vim
)

echo $0:update package list
#sudo apt update

echo $0:install bash
sudo apt install -y code

echo $0:version $(code --version)

echo $0:install extensions
for extension in "${EXTENSIONS[@]}"; do
    code --install-extension ${extension}
done

echo $0:done.
unset EXTENSIONS
exit 0


