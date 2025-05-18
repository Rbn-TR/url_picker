#!/bin/bash
domain=$1
mkdir $domain && cd $domain

echo "[*] Subdomain keşfi..."
subfinder -d $domain -silent > subs.txt
httpx -silent -mc 200 < subs.txt > live.txt

echo "[*] Arşivlenmiş URL'ler çekiliyor..."
cat live.txt | gau > gau.txt
cat live.txt | waybackurls > wayback.txt
cat live.txt | hakrawler > hakrawler.txt
katana -list live.txt -silent -depth 3 > katana.txt

echo "[*] Hepsi birleştiriliyor..."
cat gau.txt wayback.txt hakrawler.txt katana.txt | sort -u > all_urls.txt
cat all_urls.txt | grep "=" > urls_with_params.txt

echo "[*] Geçerli parametreli URL'ler filtreleniyor..."
cat urls_with_params.txt | httpx -mc 200,201,301,302,400 | tee ready_scan.txt

echo "[+] Bitti. URL sayısı: $(wc -l < ready_scan)"
echo " ready_scan.txt dosyasını dalfox, commix, xss vs. tarayabilirsiniz"
