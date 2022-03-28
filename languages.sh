#!/bin/sh

npm i -g emmet-ls
npm i -g bash-language-server
npm i -g vscode-langservers-extracted
brew install ninja
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
# ./bin/lua-language-server
npm install -g graphql-language-service-cli
npm install -g typescript typescript-language-server