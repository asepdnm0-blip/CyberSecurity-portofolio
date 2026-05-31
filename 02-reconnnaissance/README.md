# Reconnaissance & Scanning

## Objective
Mengidentifikasi host aktif, port terbuka, service yang berjalan, dan potensi vulnerability di target.

## Lab Environment
Role	IP Address	MAC Address
Attacker	192.168.56.101	— (Kali Linux)
Target	192.168.56.103	08:00:27:A8:A4:24
Gateway	192.168.56.1	0A:00:27:00:00:13

## Tools Used
Nmap 7.98
VirtualBox Host-Only Network (192.168.56.0/24)

## Phase 1 — Host Discovery
nmap -sn 192.168.56.0/24
IP Address	Status	Latency
192.168.56.1	up	0.0012s
192.168.56.100	up	0.0014s
192.168.56.101	up	—
192.168.56.102	up	—
192.168.56.103 ← target	up	0.0066s
5 host aktif ditemukan dari 256 IP dalam 7.90 detik.

## Phase 2 — Port & Service Scan
nmap -sV -sC -O -oN nmap_output_1.txt 192.168.56.103
Port	State	Keterangan
1–1000 (semua)	filtered	no-response — firewall aktif memblokir probe
OS detection: tidak dapat ditentukan — terlalu banyak fingerprint yang cocok.

## Phase 3 — Vulnerability Scan
nmap --script vuln -p 80,135,139,445,3389 192.168.56.103 -oN vuln_scan_1.txt
Port	Service	State
80	http	filtered
135	msrpc	filtered
139	netbios-ssn	filtered
445	microsoft-ds	filtered
3389	ms-wbt-server	filtered

## Key Observations
5 host aktif teridentifikasi, target dipilih di 192.168.56.103
Semua port dalam kondisi filtered — firewall host aktif menjatuhkan (drop) paket
OS tidak dapat diidentifikasi secara spesifik
Tidak ada port terbuka yang bisa dieksploitasi via network langsung
Eksploitasi dilanjutkan melalui payload delivery via shared folder (simulasi phishing)

## Screenshots
![Nmap Full Scan](./screenshots/01_nmap_full_scan.png)
