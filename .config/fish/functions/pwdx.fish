function pwdx
  lsof -a -p $argv -d cwd -Fn | tail -1 | sed 's/.//'
end
