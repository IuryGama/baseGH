#!/usr/bin/zsh
#
# Author: Wellington Moraes <wellpunk@gmail.com> [https://github.com/mswell/dotfiles/blob/master/config/zsh/custom.zsh]
# 

[ -f $HOME/.config/zsh/functions.zsh ] && source $HOME/.config/zsh/functions.zsh && source $HOME/.config/zsh/basics.zsh

wellRecon() {
  wellSubRecon
  # subPermutation
  naabuRecon
  getalive
  dnsrecords
  wellNuclei
}

wellNuclei() {
  updateTemplatesNuc
  # jiraScan
  nucTakeover
  graphqldetect
  swaggerUIdetect
  GitScan
  panelNuc
  exposureNuc
}
