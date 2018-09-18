# fakeAUR
Important if you want to use the script and not the AUR package:
I use ps -f and filter the output with grep and then eval the result of that. And since I needed a different grep script etc. so that the AUR package will function correctly you need to copy something from an older script version to the new one if you want to use the new one. The last one that should work for you is b8f4cfac0c5a598f4bc559e928427477ca8c99d6 "Piping is now possible". Just copy what is between -btw ) and the last uncommented echo. That being said: There is no real difference between the newest version and the first version and that one (as of 18th of September 2018).

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
