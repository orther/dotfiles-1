#!/usr/bin/env bash

brew install bash
echo Upgrading bash, will need your password twice
sudo bash -c "echo /usr/local/bin/bash >> /private/etc/shells"
chsh -s /usr/local/bin/bash
