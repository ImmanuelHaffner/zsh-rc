export DEFAULT_USER=immanuel


# Shortcut to University directory
alias uni='cd /home/immanuel/Documents/University/'

# Shortcut to Sierra's Clang directory
alias gosierra='cd /home/immanuel/Documents/Sierra/'
alias gosclang='cd /home/immanuel/Documents/Sierra/llvm/tools/clang/'

alias sierra='/home/immanuel/Documents/Sierra/build_debug/bin/clang -fsierra'
alias sierra++='/home/immanuel/Documents/Sierra/build_debug/bin/clang++ -fsierra'


#===============================================================================
#
# Git
#
#===============================================================================

alias glg='git lg'
alias gst='git st'


#===============================================================================
#
# Sxiv
#
#===============================================================================

alias sxiv='sxiv-rifle'

#===============================================================================
#
# Merge PDFs
#
#===============================================================================
#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=finished.pdf file1.pdf file2.pdf

# TODO implement a function for merging PDFs


#===============================================================================
#
# SVN
#
#===============================================================================

# Colorize SVN
# ------------
# Adds color to the output of commands like svn status and svn update.
# The original version of the script was posted by Ash_ on Stackoverflow
# Source: http://stackoverflow.com/questions/8786400/svn-add-colors-on-command-line-svn-with-awk-in-bash

function svn {
# Skip the color script when running an svn commit.
if [ "$1" == "ci" ] || [ "$1" == "commit" ] || [ "$1" == "add" ]
then
  command svn "$@";
  return;
fi

# For 'svn log' and 'svn diff' pipe output through colordiff
if [ "x$1" = "xlog" ]
then
  command svn "$@" -r 0:HEAD | colordiff;
  return;
fi
if [ "x$1" = "xdiff" ]
then
  command svn "$@" | colordiff;
  return;
fi


# Pipe svn through awk to colorize its output.
command svn "$@" | awk '
BEGIN {
cpt_c=0;
}
{
  if ($1=="C") {
    cpt_c=cpt_c+1;
    print "\033[31m" $0 "\033[00m"; # Conflicts are displayed in red
  }
else if ($1=="M") {
  print "\033[31m" $0 "\033[00m"; # Modified in red
}
else if ($1=="A") {
  print "\033[32m" $0 "\033[00m"; # Add in green
}
else if ($1=="?") {
  print "\033[36m" $0 "\033[00m"; # New in cyan
}
else if ($1=="D") {
  print "\033[31m" $0 "\033[00m"; # Delete in red
}
else if ($1=="U") {
  print "\033[35m" $0 "\033[00m"; # Updated in light magenta
}
else if ($1=="X") {
  print "\033[33m" $0 "\033[00m"; # No changes in yellow.
}
else if ($1=="At" || $1 == "External") {
  print "\033[33m" $0 "\033[00m"; # Revision numbers in brown.
}
else {
  print $0; # No color, just print the line
}
}
END {
print cpt_c, " conflicts are found.";
}';
}
