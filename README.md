# fakeAUR
Branch for people that can't use the AUR. Keep in mind that I created this branch at a later date, so it might contain some AUR-only versions.

Old description in case you want to use the old version of the script (the new one works without -echo and works like it is described in 4)):
_______
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
