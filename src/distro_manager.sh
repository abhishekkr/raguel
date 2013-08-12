#!/usr/bin/env bash

# check for Distro Mother and load for Info & Commands
load_distro_specifics(){
  if [ -f /etc/redhat-release ]; then
    export RAGUEL_DISTRO_TYPE='rhel'
    export RAGUEL_PACKAGE_INSTALL='yum install -y '
    export RAGUEL_PACKAGE_UNINSTALL='yum erase -y '
  elif [ -f /etc/debian_version ]; then
    export RAGUEL_DISTRO_TYPE='debian'
    export RAGUEL_PACKAGE_INSTALL='apt-get -y install '
    export RAGUEL_PACKAGE_UNINSTALL='apt-get -y remove '
  elif [ -f /etc/gentoo-release ]; then
    export RAGUEL_DISTRO_TYPE='gentoo'
    export RAGUEL_PACKAGE_INSTALL='emerge '
    export RAGUEL_PACKAGE_UNINSTALL='emerge --depclean '
  elif [ -f /etc/arch-release ]; then
    export RAGUEL_DISTRO_TYPE='arch'
    export RAGUEL_PACKAGE_INSTALL='pacman -Sy --noconfirm '
    export RAGUEL_PACKAGE_UNINSTALL='pacman -R --noconfirm '
  elif [ `uname -s` == 'FreeBSD' ] ; then
    export RAGUEL_DISTRO_TYPE='bsd'
    export RAGUEL_PACKAGE_INSTALL='pkg_add -r  '
    export RAGUEL_PACKAGE_UNINSTALL='pkg_deinstall --preserve '
  elif [ -f /etc/SuSE-release ] ; then
    export RAGUEL_DISTRO_TYPE='slackware'
    export RAGUEL_PACKAGE_INSTALL='zypper install -y '
    export RAGUEL_PACKAGE_UNINSTALL='zypper remove -y '
  else
    echo "Raguel is not able to find signature of this Distro."
    export RAGUEL_DISTRO_TYPE=
    export RAGUEL_PACKAGE_INSTALL=
    export RAGUEL_PACKAGE_UNINSTALL=
  fi
}
