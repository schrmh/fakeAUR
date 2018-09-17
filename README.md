# fakeAUR
fakeAUR
You need to use the option -echo and provide AUR helper (e.g. yay) + old name package name, new package name and new description:
fakeAUR -echo "yay fakeAUR" nani "now you can speak japanese"

use -btw for a btwiusearch message and -nani for that nani message.
-grep will grep the original description of the piped package
TODO: 1). switch between core/community/aur or custom with colour. Also version, size, orphanded, etc.
2) Manipulate multiple packages at once and list them just like a package helper would
3) Copy a screnshoot to clipboard
4) implement piping: yay fakeAUR | fakeAUR nani "now you can speak japanese"
5) Fix formatted output for trizen..
