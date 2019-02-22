set -x ASDF_DATA_DIR ~/.config/asdf

if test -d $ASDF_DATA_DIR
    source $ASDF_DATA_DIR/asdf.fish
end
