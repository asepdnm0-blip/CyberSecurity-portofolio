# CyberSecurity-portofolio
Penetration testing porto - isolated lab

# Cyber Security Portfolio
### Asep Dwi NurMaulid | UTA'45

![Methodology](https://img.shields.io/badge/Methodology-PTES-blue)
![Framework](https://img.shields.io/badge/Framework-MITRE_ATT%26CK-red)
![Platform](https://img.shields.io/badge/Platform-Kali_Linux-purple)
![Status](https://img.shields.io/badge/Status-Completed-green)
---

## About This Portfolio
Dokumentasi teknis dari serangkaian latihan penetration testing yang
dilakukan di lingkungan lab virtual yang sepenuhnya terisolasi.
Semua target adalah mesin virtual milik sendiri. Tidak ada sistem
nyata yang diuji.

## Lab Environment
|   Role   |      OS     |   IP Address   |
|----------|-------------|----------------|
| Attacker | Kali Linux  | 192.168.56.101 |
| Target   | Windows 10  | 192.168.56.1   |
| Network  | Host-only   | 192.168.56.0/24|

## MITRE ATT&CK; Coverage
|       Tactic        |        Technique          |      ID      |
----------------------|---------------------------|--------------|
| Initial Access      | Phishing: Mal. Attachment |  T1566.001   |
| Execution           | User Execution            |  T1204.002   |
| Defense Evasion     | Obfuscated Files          |  T1027       |
| Persistence         | Registry Run Keys         |  T1547.001   |
| Privilege Escalation| Token Manipulation        |  T1134       |
| Command & Control   | Application Layer Proto   |  T1071.001   |

## Table of Contents
- [01 Introduction & Ethics](./01-introduction/)
- [02 Reconnaissance & Scanning](./02-reconnaissance/)
- [03 Exploitation](./03-exploitation/)
- [04 Post-Exploitation](./04-post-exploitation/)
- [05 Final Report & Mitigations](./05-final-report/)
- [06 YARA Detection Rules](./06-yara-rules/)

## Disclaimer
All activities were performed in an isolated virtual lab environment
for educational purposes only.
