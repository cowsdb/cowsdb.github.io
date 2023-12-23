# 🐄 [CowsDB Repo](https://cowsdb.github.io)

[![Debian and RPM Repo](https://github.com/cowsdb/cowsdb.github.io/actions/workflows/repo.yml/badge.svg)](https://github.com/cowsdb/cowsdb.github.io/actions/workflows/repo.yml)

This `deb`/`rpm` repository is powered by [Github Actions](https://github.com/cowsdb/cowsdb.github.io/tree/main/.github), [Github Pages](https://jon.sprig.gs/blog/post/2835) and [nfpm](https://nfpm.goreleaser.com/)

<!-- update: 202305111130 -->


## Installation Script
### DEB System
```bash
wget -q -O - https://github.com/cowsdb/cowsdb.github.io/raw/main/libcows_installer.sh | sudo bash
sudo apt install -y libcows
```
### RPM System
```bash
wget -q -O - https://github.com/cowsdb/cowsdb.github.io/raw/main/libcows_installer.sh | sudo bash
sudo yum install libcows
```
