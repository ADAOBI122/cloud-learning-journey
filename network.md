# 🌐 Networking Fundamentals for Cloud Learning

## 📌 Table of Contents
1. Introduction to Networking  
2. Types of Networks  
3. IP Addressing  
4. Subnetting  
5. DNS (Domain Name System)  
6. OSI & TCP/IP Models  
7. Common Protocols  
8. Ports and Services  
9. Firewalls & Security  
10. Load Balancing  
11. NAT (Network Address Translation)  
12. VPC (Virtual Private Cloud)  
13. VPN & Connectivity  
14. Networking in Cloud (AWS, Azure, GCP)  
15. Best Practices  

---

## 1️⃣ Introduction to Networking
Networking is the practice of connecting a group of computers or devices to share information and communicate .

### Key Concepts:
- **Node**: Any device on a network (computer, server, router)
- **Link**: Communication path between nodes
- **Protocol**: Rules governing communication (the language that they understand and use in communication)

---

## 2️⃣ Types of Networks

| Type | Description |
|------|------------|
| LAN  | Local Area Network (small area like office/home) |
| WAN  | Wide Area Network (large area, e.g., internet) |
| MAN  | Metropolitan Area Network |
| PAN  | Personal Area Network |

---

## 3️⃣ IP Addressing
- ip addressing is more like a home address where data or information are delivered to by the server .

### IPv4 (internet protocol version 4): is the system that assign addresses .
- Format: `x.x.x.x`
- Example: `192.168.1.1`
- 4 octets (each 0–255)
- 32-bit address
What is an Octet?

- Each octet = 8 bits

So:

1 octet = 8 bits
4 octets = 8 × 4 = 32 bits



### IPv6 (IPv6 is also used to create IP addresses, and it is a more advanced version of IPv4)

- Format: `xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx`(There are 8 groups Each group is called a hextet)
What does that mean?

Each x can be:

Numbers: 0–9
Letters: a–f

- this is called hexadecimal (base 16)

- 128-bit address

Why it is 128-bit?

Each group (hextet) = 16 bits
There are 8 groups

16 × 8 = 128 bits

---

### Private IP Ranges
- `10.0.0.0 – 10.255.255.255`
- `172.16.0.0 – 172.31.255.255`
- `192.168.0.0 – 192.168.255.255`

---

### Public vs Private IP
| Type | Description |
|------|------------|
| Public IP | Accessible over the internet |
| Private IP | Used inside internal networks |

---

## 4️⃣ Subnetting

Subnetting tells a device which group or network it belongs to.Subnetting is the process of dividing a large IP network 
into smaller, logical, and more manageable segments called subnets 

### Example:
IP: 192.168.1.0/24
here 24 is the CIDR notation
 
- `/24` = Subnet mask
- 256 total IPs
- 254 usable hosts 
### calculating the example to be clear.
Step 1: Understand `/24`
- `/24` = **subnet mask**
- Means **first 24 bits are for the network**
- Remaining 8 bits are for **devices (hosts)**

Step-by-step breakdown
1️⃣. tal bits in IPv4
IPv4 = 32 bits total
2️⃣Bits used for hosts
32 − 24 = 8 bits for hosts
2^8=256 

192.168.1.0 → network address (not usable)
192.168.1.256 → broadcast (not usable)

So what’s left?

 256 total
 minus 2 (2 is gotten from the two non usable ips)


256 - 2 = 254 usable IPs

 Final simple understanding
/24 = 256 total IPs
Remove 2 (special ones)
= 254 usable devices

###Formula for Total IPs

Number of Host Bits = 32 - Subnet Mask (CIDR)

**CIDR = Classless Inter-Domain Routing **

But for most people, think of it as:

The “/number” at the end of an IP that tells you how big the network is.

Total IPs = 2^Number of Host Bits


- Formula for Usable IPs
 Usable IPs=total ips −2

Subtract 2 because: this is where the 2 you are subtracting is gotten from.
1 IP = Network Address
1 IP = Broadcast Address

###Formula concept for ipv6

Yes, you can still use the same formula in theory:

Number of host bits = 128 − CIDR

Total IPs=2^Number of Host Bits
Usable IPs = total IPs − 2 (network + broadcast) but in IPv6, broadcast doesn’t exist, so often you use all addresses.

###TASK FOR IPV6 subnetting .
Given IPv6 network:

2001:0db8:85a3::/64
###solution 
Host bits = 128 − 64 = 64 
Total IPs = 2^64 = 18,446,744,073,709,551,616
That’s over 18 quintillion IPs!

Important: IPv6 does not use broadcast addresses, so all 2^64 addresses are technically usable.

### Benefits:
- Better organization
- Improved security
- Efficient IP usage

---

## DNS (Domain Name System)

DNS translates domain names into IP addresses.

### Example:
google.com → 142.250.190.14



---

## 6️⃣SI Model (Open Systems Interconnection)(7 Layers)

| Layer | Name |
|------|------|
| 7 | Application |
| 6 | Presentation |
| 5 | Session (conversation manager) |
| 4 | Transport |
| 3 | Network |
| 2 | Data Link |
| 1 | Physical |

---

## TCP/IP Model (Simplified version of OSI mode )

| 4 Layer | Description |
|------|------------|
| Application | User interaction |
| Transport | Data delivery (TCP/UDP) |
| Internet | Routing (IP) |
| Network Access | Physical transmission |

---

## 7️⃣ommon Protocols
- protocol in a laymans understanding is basically the language the computer use to communicate.
Think of it like a language: just like humans need a common language to talk, computers need protocols to “understand” each other. 

| Protocol | Purpose |
|----------|--------|
| HTTP/HTTPS | Web traffic |
| FTP | File transfer |
| SSH | Secure remote login |
| TCP | Reliable communication |
| UDP | Fast but unreliable |

---

## 8️⃣.ports and Services
- you need port and service to be able to work with protocol.

| Port | Service |
|------|--------|
| 80 | HTTP |
| 443 | HTTPS |
| 22 | SSH |
| 21 | FTP |
| 53 | DNS |

---

## 9️⃣.firewalls & Security

Firewalls is the security that protects webservers like nginx and apache . or you can say
A firewall is a network security system that monitors and controls incoming and outgoing traffic to a server or network.

### Types:
- Network firewall
- Host-based firewall

### Rules:
- Allow
- Deny

**Why Firewalls Are Critical for Servers**
- Servers store important data
Your web server or database contains files, code, and user information.
If it’s exposed without control, attackers can steal or modify your data.
Firewalls control access
They act like a security gate, only allowing traffic that is safe and necessary.
Example: Only allow HTTP (port 80), HTTPS (port 443), and maybe SSH (port 22) from trusted IPs.
Avoid leaving unsafe ports open
If you leave file transfer ports (FTP, SMB, etc.) open to the internet:
Hackers could upload malicious files
They could download sensitive data
Your server becomes vulnerable
Minimize attack surface
Only open ports that are required for your application.
Every extra open port is another potential entry point for attackers.
Result:
Your application stays secure and reliable
Data remains safe from tampering or theft
Server resources are protected from misuse
---

## Load Balancing

Distributes traffic across multiple servers.
A load balancer is a device or service that distributes incoming traffic across multiple servers so that no single server gets overloaded.

### Types:
- Round Robin
- Least Connections
- IP Hash

### Benefits:
- High availability
- Scalability
- Fault tolerance

---

## NAT  (Network Address Translation)

Allows multiple devices to share one public IP.you can also say NAT is a technique that changes the private IP addresses of devices
 in your local network into a public IP address when they access the internet, and vice versa.

### Types:
- Static NAT
- Dynamic NAT
- PAT (Port Address Translation)

---

## VPC (Virtual Private Cloud)

A logically isolated network in the cloud where you can run your servers, databases, and applications.
You control who can access it, which subnets exist, and how the traffic flows..

### Components:
- Subnets
- Route tables
- Internet Gateway
- NAT Gateway

---

## VPN (Virtual Private Network)

Secure connection between networks over the internet.

### Types:
- Site-to-Site VPN
- Client VPN

---

## Networking in Cloud

### AWS
- VPC
- Subnets
- Security Groups
- Elastic ip 
Elastic IP & Cloud Billing
Elastic IP itself = just a fixed public IP address.
Cost depends on usage:
If the IP is attached and actively used, you usually pay a small hourly fee (some clouds like AWS charge only if you have unused IPs).
If traffic is high, your cloud provider may charge for data transfer through that IP.
If traffic decreases, your overall bill decreases — you’re not paying for unused bandwidth.


---

## Best Practices

✅ Use private subnets for internal services  
✅ Use public subnets only when necessary  
✅ Implement least privilege access  
✅ Enable logging and monitoring  
✅ Use load balancers for scalability  
✅ Secure with firewalls and security groups  

---

## 🎯 Summary

- Networking is the backbone of cloud computing  
- Understand IP addressing, DNS, and subnetting deeply  
- Learn how cloud providers implement networking  
- Focus on **security and scalability**

---

