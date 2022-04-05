function _peco_goto_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
    nvim
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_goto_directory
  begin
    ls -ad /Users/philippe/Documents/Workspace/FRONTEND-MONO/apps/*
    ls -ad /Users/philippe/Documents/Workspace/FRONTEND-MONO/libs/*
    ls -ad $HOME/dotfiles/*
    ls -ad $HOME/Documents/Workspace/*
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_goto_directory $argv
end

