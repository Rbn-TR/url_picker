# url_picker
Recon Automation Script

# Recon Automation Script 🕵️‍♂️

Bu Bash script'i, belirttiğiniz domain için pasif ve aktif keşif araçlarını birleştirerek URL toplama ve filtreleme işlemini otomatikleştirir.

## 🔧 Kurulum

Aşağıdaki araçların sisteminizde kurulu olması gerekir:

- [subfinder](https://github.com/projectdiscovery/subfinder)
- [httpx](https://github.com/projectdiscovery/httpx)
- [gau](https://github.com/lc/gau)
- [waybackurls](https://github.com/tomnomnom/waybackurls)
- [hakrawler](https://github.com/hakluke/hakrawler)
- [katana](https://github.com/projectdiscovery/katana)

Tüm araçları yüklemek için:

```bash
cat requirements.txt | xargs -n 1 go install
```

## 🚀 Kullanım

```
chmod +x script.sh
./script.sh example.com
```
