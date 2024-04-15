#!/bin/sh
pushd ~/.dotfiles
nix build .#homeManagerConfigurations.luca.activationPackage
./result/activate
popd
