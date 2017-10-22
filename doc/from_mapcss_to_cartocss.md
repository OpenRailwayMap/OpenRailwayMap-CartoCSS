# Migration of a MapCSS style sheet to CartoCSS

There is no automatical migration path from a MapCSS to CartoCSS but a
few regular expression will make it easier.


Here are the most important commands, I entered into Vim during the migration.
Theres is not garantuee that they work for you, too!

```vim
:%s/\t/  /g
:%s/way|z\([0-9]\+\)-\[/[zoom>=\1][/g
:%s/way|z\([0-9]\+\)-\([0-9]\+\)/[zoom>=\1][zoom<=\2]/g
:%s/way\[/[/g
:g/z-index/d
:%s/ width:/ line-width:/g
:%s/\]\n[ ]*{/] {/g
:%s/ dashes: / line-dasharray: /g
:%s/ color: / line-color: /g
:%s/ opacity: / line-opacity: /g
:%s_ casing-width:\(.*\)$_/* casing-width:\1 */_g
:%s/\[!\([a-z_:"]\+\)]/[\1=""]/g
:%s/\["\([a-z_]\+\):\([a-z_]\+\)"/["\1_\2"/g
:%s/\[\([a-z_]\+\)/\["\1"/g
:%s/=\([a-z_]\+\)\]/="\1"]/g
:%s/"zoom"/zoom/g
:%s/"=""\]/"=null]/g
```
