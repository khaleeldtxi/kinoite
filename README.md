# Fedora Kinoite post-installation setup

## Update Fedora Kinoite/Silverblue 

``` 
rpm-ostree upgrade -r
```
\# Flag -r will reboot your machine when rpm-ostree finishes 



## Initial setup

After rebooting, you should run this scripts

```
git clone https://github.com/khaleeldtxi/kinoite/
cd kinoite
sudo chmod a+x kinoite.sh flatpak.sh
```

```
./kinoite.sh
```

## Configure Flatpak

```
./flatpak.sh
```

### Update system apps (rpm-ostree), flatpak & distrobox containers with a single command: 
```
flatpak update -y && distrobox-upgrade --all && rpm-ostree upgrade
```

Add alias to your ~/.bash_profile or ~/.zshrc
```
alias update="flatpak update -y && distrobox-upgrade --all && rpm-ostree upgrade"
```
