# SDDM-WIRED


This is a fork of [sddm-wired-lain-theme](https://github.com/lll2yu/sddm-lain-wired-theme) that reinstates upon [new login page](https://fauux.neocities.org/login) 


credits to [slowayyy](https://github.com/slowayy/SDDM-Lain-Wired/) for images and more.

### Installation :-

- clone this directory `git clone https://github.com/ioresolution/sddm-wired`
- copy directory to  `/usr/share/sddm/themes/` using `sudo cp -r sddm-wired /usr/share/sddm/themes/`
- install ```sddm``` ```qt5-multimedia```  ```qt5-quickcontrols``` ````noto-fonts````
- set sddm as your current login manager ```systemctl enable sddm && systemctl start sddm```

### Usage
- Open up your configuration file `/etc/sddm.conf` and set `sddm-wired` as your current theme

```shell
[Theme]
# Current theme name
Current=sddm-wired
```

#### To-Do 

- change session button image
- change shutdown + restart button image
#
![](https://github.com/ioresolution/sddm-wired/blob/main/Preview.png)
