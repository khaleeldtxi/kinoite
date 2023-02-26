# Fedora Kinoite post-installation setup

## Update Fedora Kinoite/Silverblue 

``` 
rpm-ostree upgrade -r
```
\# Flag -r will reboot your machine when rpm-ostree finishes 



## Initial setup

After rebooting, you should run this scripts
```
./kinoite.sh
```

## Configure Flatpak

```
./flatpak.sh
```

### Update system apps (rpm-ostree), flatpak & distrobox containers with a single command: 
```
flatpak update && distrobox-upgrade --all && rpm-ostree upgrade
```

Add alias to your ~/.bash_profile or ~/.zsh_profile
```
alias update=flatpak update && distrobox-upgrade --all && rpm-ostree upgrade
```
