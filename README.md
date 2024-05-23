# sddm-wired (temp)


Another fork of [sddm-wired-lain-theme](https://github.com/lll2yu/sddm-lain-wired-theme)   +   [this](https://github.com/slowayy/SDDM-Lain-Wired/) !!!

### Installation :-

- clone this directory
- copy directory to  `/usr/share/sddm/themes/`
- install ```sddm``` ```qt5-multimedia```  ```qt5-quickcontrols``` ````noto-fonts````
- set sddm as your current login manager ```sudo systemctl enable sddm; sudo systemctl start sddm```

### Usage
- Open up your configuration file `/etc/sddm.conf` and set `sddm-wired` as your current theme

```shell
[Theme]
# Current theme name
Current=sddm-wired
```

#### Thoughts 

My initial goal was to implement what slowayy was trying to go for here (currently his repo is read-only)
> the first idea was animate this image until fills the bottom screen, with animation ([line: 138](https://github.com/slowayy/SDDM-Lain-Wired/blob/main/Main.qml))

Which I failed to do. Thats asking for a lot! or (at least to me). I think, this one is good as it is right now. 

![](https://github.com/ioresolution/sddm-wired/blob/main/Preview.png)
