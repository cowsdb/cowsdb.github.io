---
layout: home
title: CowsDB Package Repository
---

## Installation Script
### DEB System
```bash
wget -q -O - https://github.com/cowsdb/cowsdb.github.io/raw/main/libcows_installer.sh | sudo bash
sudo yum install -y libcows
```
### RPM System
```bash
wget -q -O - https://github.com/cowsdb/cowsdb.github.io/raw/main/libcows_installer.sh | sudo bash
sudo apt install libcows
```

<br>

## Manual
### Add a Debian Repository

Download the [public key](cowsdb.gpg)
```
wget -qO- {{ site.url }}/cowsdb.gpg | sudo tee /etc/apt/trusted.gpg.d/cowsdb.gpg >/dev/null
```

Next, create the source in `/etc/apt/sources.list.d/`

```
echo "deb [arch=all signed-by=/etc/apt/trusted.gpg.d/cowsdb.gpg] {{ site.url }}/deb stable main" | sudo tee /etc/apt/sources.list.d/cowsdb.list >/dev/null
```

Then run `apt update && apt install -y` followed by the names of the packages you want to install.

```
apt install libcows
```

### Add a RPM Repository

Download the repo file `cd /etc/yum.repos.d ; curl {{ site.url }}/cowsdb.repo -LO`

Then you can do `yum install -y` followed by the names of the packages you want to install.

```
yum install libcows
```
