# Reconnaissance & Scanning

## Objective
Mengidentifikasi host aktif, port terbuka, service yang berjalan,
versi software, dan potensi vulnerability di target.

## Lab Environment
| Role     | IP Address     | MAC Address       |
|----------|----------------|-------------------|
| Attacker | 192.168.56.101 | (Kali Linux)      |
| Target   | 192.168.56.103 | 08:00:27:A8:A4:24 |
| Gateway  | 192.168.56.1   | 0A:00:27:00:00:13 |

## Tools Used
- Nmap 7.98
- VirtualBox Host-Only Network (192.168.56.0/24)

---

## Scan Results

**Commands:**
```bash
nmap -sn 192.168.56.0/24
nmap -sV -sC -O -oN nmap_output_1.txt 192.168.56.103
nmap --script vuln -p 80,135,139,445,3389 192.168.56.103 -oN vuln_scan_1.txt
```

---

## Key Observations

| Temuan | Detail | Implikasi |
|--------|--------|-----------|
| 5 host aktif | Dari 256 IP di subnet | Target berhasil diidentifikasi di .103 |
| Semua port filtered | 1000 port TCP tidak merespons | Firewall host aktif di target |
| OS tidak teridentifikasi | Terlalu banyak fingerprint cocok | VM atau hardening aktif |
| Port 80, 135, 139, 445, 3389 filtered | Tidak ada response | Tidak bisa dieksploitasi via network langsung |

## Analysis
Target `192.168.56.103` aktif namun seluruh port dalam kondisi `filtered`, artinya
firewall host secara aktif menjatuhkan (drop) paket dari scanner. Kondisi ini berbeda
dari `closed` — service mungkin berjalan tapi diblokir dari luar. Karena tidak ada port
yang terbuka, eksploitasi dilanjutkan melalui vektor non-network yaitu payload delivery
via shared folder yang mensimulasikan phishing attachment.

---

## Screenshots
![Nmap Full Scan](./screenshots/01_nmap_full_scan.png)
*Hasil lengkap host discovery, port scan, dan vulnerability scan terhadap 192.168.56.103*
