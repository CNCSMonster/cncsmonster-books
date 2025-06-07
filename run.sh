sudo rm -r book
gms -d . -o SUMMARY.md
nohup mdbook serve -n 0.0.0.0 &
