2022-05-03
  # Clean up orphan packages:
  sudo pacman -Rns $(sudo pacman -Qdtq)

2022-05-04
  # A terrible way to remove the last newline if there is a newline.
  perl -pe 'chomp if eof'
