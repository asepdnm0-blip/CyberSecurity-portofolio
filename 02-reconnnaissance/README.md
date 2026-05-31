# Reconnaissance & Scanning

## Objective
Mengidentifikasi host aktif, port terbuka, service yang berjalan,
versi software, dan potensi vulnerability di target.

## Target Information
| Parameter | Value |
|-----------|-------|
| IP Address | 192.168.56.1 |
| OS | Windows (tidak teridentifikasi spesifik — fingerprint ambiguous) |
| MAC Address | 0A:00:27:00:00:13 |

## Tools Used
- Nmap 7.98

## Host Discovery
Dari scan `-sn` pada subnet `192.168.56.0/24`, ditemukan 4 host aktif:

| IP Address | Status | Keterangan |
|------------|--------|------------|
| 192.168.56.1 | Up | Target (Windows Host) |
| 192.168.56.100 | Up | Oracle VirtualBox virtual NIC |
| 192.168.56.101 | Up | Kali Linux (Attacker) |
| 192.168.56.102 | Up | Host lain di subnet |

## Port Scan Results
Scan `-sV -sC -O` terhadap `192.168.56.1` menunjukkan semua 1000 port
dalam kondisi **filtered** — tidak ada port terbuka yang terdeteksi.
OS fingerprinting tidak dapat memberikan hasil spesifik karena terlalu
banyak kemungkinan yang cocok.

## Vulnerability Scan Results
| Port | Service | State |
|------|---------|-------|
| 80 | http | filtered |
| 135 | msrpc | filtered |
| 139 | netbios-ssn | filtered |
| 445 | microsoft-ds | filtered |
| 3389 | ms-wbt-server | filtered |

## Key Observations
- Semua port dalam kondisi filtered, mengindikasikan Windows Firewall
  aktif memblokir koneksi dari arah Kali Linux
- OS tidak dapat diidentifikasi secara spesifik via fingerprinting
- Tidak ditemukan port terbuka yang langsung bisa dieksploitasi

## Implikasi untuk Fase Berikutnya
Karena firewall aktif, vektor serangan beralih ke **client-side attack**
(payload yang dieksekusi dari sisi target) bukan network-based exploit.
Ini yang mendasari penggunaan MSFvenom reverse_tcp pada fase eksploitasi.
