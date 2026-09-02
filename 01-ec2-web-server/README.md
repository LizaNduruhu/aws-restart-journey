# Lab 01 — EC2 Web Server

## Overview

This lab is my first hands-on Amazon EC2 deployment as part of my AWS re/Start learning journey.

I will launch, configure, monitor, resize, protect, and eventually terminate an EC2 instance while documenting what I learn at each stage.

---

## Objectives

* Launch an Amazon EC2 instance
* Understand Amazon Machine Images (AMIs)
* Configure an EC2 instance type
* Configure a security group
* Deploy a web server using User Data
* Monitor instance health
* Configure HTTP access
* Resize an EC2 instance
* Resize an EBS volume
* Configure termination protection
* Understand the EC2 instance lifecycle

---

## AWS Services

* Amazon EC2
* Amazon EBS
* Amazon CloudWatch
* AWS Security Groups

---

## Deployment

### EC2 Instance

The web server was deployed using Amazon EC2 with the following configuration:

| Configuration         | Value                     |
| --------------------- | ------------------------- |
| Operating System      | Amazon Linux 2023         |
| Instance Type         | t3.micro                  |
| Storage               | 8 GiB gp3                 |
| Public IPv4           | Enabled                   |
| Security Group        | Web Server security group |
| Initial Inbound Rules | None                      |
| Web Server            | Apache HTTP Server        |

### User Data

The EC2 instance was configured using User Data to automatically install and start Apache.

```bash
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html
```

The User Data script allowed the web server to be configured automatically when the EC2 instance launched.

---

## Security Group Testing

### Initial Configuration

Initially, the security group had no inbound rules.

Although the EC2 instance was running and passed its health checks, the web server could not be reached through its public IP address.

This demonstrated that an EC2 instance can be running correctly while still being inaccessible from the internet because network traffic is being blocked by its security group.

### HTTP Rule

An inbound HTTP rule was then added to the security group:

| Setting  | Value         |
| -------- | ------------- |
| Protocol | TCP           |
| Port     | 80            |
| Source   | Anywhere-IPv4 |

Port 80 was opened to allow HTTP web traffic to reach the Apache web server.

### Result

After the HTTP rule was added, the web server became accessible through a web browser.

The browser successfully displayed:

> Hello From Your Web Server!

This demonstrated how security groups control inbound network traffic to an EC2 instance.

---

## Monitoring

The EC2 instance was monitored through the Amazon EC2 console.

The instance successfully reached a running state and passed its available status checks.

Monitoring helps verify that the underlying instance is operating normally before troubleshooting application or network connectivity.

---

## What I Learned

* An EC2 instance is a virtual server running in AWS.
* An AMI provides the operating system and initial software environment for an EC2 instance.
* EC2 instance types determine the computing resources available to the virtual server.
* User Data can automate configuration tasks when an EC2 instance launches.
* Apache can be installed and started automatically using a User Data script.
* A security group acts as a virtual firewall controlling network traffic to an EC2 instance.
* A running EC2 instance can still be inaccessible if the required inbound traffic is not permitted.
* HTTP web traffic uses TCP port 80 by default.
* Security configuration should allow only the traffic that is required.

---

## Challenges & Troubleshooting

### Web Server Initially Inaccessible

**Problem:**
The EC2 instance was running successfully, but the web page could not be reached through its public IPv4 address.

**Investigation:**
The security group initially had no inbound rules.

**Solution:**
An inbound HTTP rule allowing TCP traffic on port 80 from Anywhere-IPv4 was added.

**Result:**
The web server became accessible and displayed:

> Hello From Your Web Server!

This helped reinforce the relationship between an EC2 instance, its web server, and its security group.

---

## Screenshots

Screenshots documenting the deployment and configuration of the EC2 web server will be added to this section.

Planned evidence includes:

* EC2 launch configuration
* Running EC2 instance
* Successful status checks
* Initial security group with no inbound rules
* HTTP security group rule
* Working web server
* EC2 monitoring
* Instance resizing
* EBS volume resizing
* Termination protection
* Final instance termination

---

## Video Demonstration

A video demonstration of this lab will be added to document the hands-on deployment process and key concepts learned.

---

## Status

🟡 In Progress

More sections will be completed as the remaining stages of the lab are performed.
