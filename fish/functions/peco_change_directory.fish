function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_change_directory
  begin
    ls -ad /Users/philippe/Documents/Workspace/FRONTEND-MONO/apps/*
    ls -ad /Users/philippe/Documents/Workspace/FRONTEND-MONO/libs/*
    ls -ad $HOME/dotfiles/*
    ls -ad $HOME/Documents/Workspace/* |grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end

