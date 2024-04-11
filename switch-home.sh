#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/luca/home.nix
popd
