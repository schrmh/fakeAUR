# fakeAUR
fakeAUR 2.2 - now with impossible piping (fixed)
You pipe with your package helper (only `yay` officially supported at the moment) and provide a new package name and a new description:
`yay <package> | fakeAUR nani "now you can speak japanese"`
Once you did that, you can use `fakeaur` in that terminal session without piping to it again (the old query is saved)
Options:
```
-btw without further parameters for a btwiusearch message
-nani for that nani message.
-grep will grep the original description of the piped package
-debug to check what is going on when something is wrong with the output
```

TODO:
```
1) Switch between core/community/aur or custom with colour. Also version, size, orphanded, etc.
2) Manipulate multiple packages at once and list them just like a package helper would
3) Copy a screnshoot to clipboard (termrec?)
4) Fix formatted output for trizen.. (possible solution: Do not eval; query packages and reconstruct the output of common package managers) 
5) A config file that allows custom shortcuts that are like -btw or -nani
6) Ignore shells that aren't bash too
```

  

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
