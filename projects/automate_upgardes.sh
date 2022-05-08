#!/bin/bash

apt upgrade
apt upgrade -y

# -y will answer yes when confirmation is asked
# apt upgrade sync indexes on the online repos so that APT is aware of all the recent packages/version