{ util, ... }:
{
  vim.keymaps = [
    (util.mkKeymap' "n" "b" "h")
    (util.mkKeymap' "n" "n" "j")
    (util.mkKeymap' "n" "r" "k")
    (util.mkKeymap' "n" "s" "l")

    (util.mkKeymap' "n" "ü" "r")
    (util.mkKeymap' "n" "ä" "b")
    (util.mkKeymap' "n" "ö" "s")
    (util.mkKeymap' "n" "ö" "n")

  ];
}
