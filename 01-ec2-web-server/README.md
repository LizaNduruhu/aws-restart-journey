# Lab 01 — EC2 Web Server

## Overview

This lab is my first hands-on Amazon EC2 deployment as part of my AWS re/Start learning journey.

I will launch, configure, monitor, resize, protect, and eventually terminate an EC2 instance while documenting what I learn at each stage.

## Objectives

- Launch an Amazon EC2 instance
- Understand Amazon Machine Images (AMIs)
- Configure an EC2 instance type
- Configure a security group
- Deploy a web server using User Data
- Monitor instance health
- Configure HTTP access
- Resize an EC2 instance
- Resize an EBS volume
- Configure termination protection
- Understand the EC2 instance lifecycle

## AWS Services

- Amazon EC2
- Amazon EBS
- Amazon CloudWatch
- AWS Security Groups

---

## Deployment

### EC2 Instance

The web server was deployed using Amazon EC2 with:

| Configuration | Value |
|---|---|
| Operating System | Amazon Linux 2023 |
| Instance Type | t3.micro |
| Storage | 8 GiB gp3 |
| Public IPv4 | Enabled |
| Security Group | Web Server security group |
| Initial Inbound Rules | None |
| Web Server | Apache HTTP Server |

### User Data

The EC2 instance was configured using User Data to automatically install and start Apache:

```bash
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html

### User Data

The EC2 instance was configured using User Data to automatically install and start Apache:

```bash
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html
```

## Security Group Testing

Initially, the security group had no inbound rules.

Although the EC2 instance was running and passed its health checks, the web server could not be reached through its public IP address.

After adding an inbound HTTP rule:

* **Protocol:** TCP
* **Port:** 80
* **Source:** Anywhere-IPv4

the web server became accessible through a browser.

### Result

The browser successfully displayed:

> Hello From Your Web Server!

This demonstrated how security groups control inbound network traffic to an EC2 instance.

---

## What I Learned

* An EC2 instance is a virtual server running in AWS.
* An AMI provides the operating system and initial software environment for an EC2 instance.
* User Data can automate configuration tasks when an EC2 instance launches.
* A security group acts as a virtual firewall controlling inbound and outbound traffic.
* A running EC2 instance can still be inaccessible if the required network traffic is not permitted.
* HTTP web traffic uses TCP port 80 by default.
* Security configuration should allow only the traffic that is required.

