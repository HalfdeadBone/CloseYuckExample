# CloseYuckExample
Proposal to add sh script or simillar solution to [Eww](https://github.com/elkowar/eww)

## Explenation
Closing Eww widgets is kinda.. problematic
You can call it and kill it but it's too much looking. You can also to a static function to do it.


But i think i have found a better solution by using bash to close chosen widgets in [Eww](https://github.com/elkowar/eww) (Elkoawr wacky widgets)


Daemon in Eww with the `--config` fkag, is assigned to certain path that links actions to that folder. 
It means that bash functions like 
- `pwd`
- `.`
- `which`
are usable in the space of script thus enabling to run local scripts. We are doing it dynamicly so it shouldn't cause problems.

With .yuck by using `(defvar NAME comand)` we can execute script like this:
```bash
CFG=`pwd`
EWW=`which eww`
${EWW} --config "$CFG" close $@
```
with `button :onclick` we can use it property to invoke it 
```yuck
(defvar CLOSE `./close.sh`)
  ...
    (button :onclick "`${CLOSE} widget_name`  "")
```

In addition - thanks to bash - we can also use `eww widgets` to get all curent widgets residing in the daemon, thus enabling us this:
```bash
CFG=`pwd`
EWW=`which eww`
echo `${EWW} --config "$CFG" windows | tr -d '*'`
```
To get result - all you need is `deflisten` to monitor it

```yuck
(deflisten ALLWIDGETS  `./allwidgets.sh`)
  ...
    (button :onclick "`${CLOSE} ${ALLWIDGETS}`" "")
```
