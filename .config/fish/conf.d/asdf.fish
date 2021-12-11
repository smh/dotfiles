
set -x ASDF_DATA_DIR ~/.config/asdf

if test -d $ASDF_DATA_DIR
  source (brew --prefix asdf)/libexec/asdf.fish

  if test -d $ASDF_DATA_DIR/plugins/java
     source $ASDF_DATA_DIR/plugins/java/set-java-home.fish
  end
end
