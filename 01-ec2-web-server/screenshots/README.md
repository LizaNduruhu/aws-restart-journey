Evidence from Lab 01 — EC2 Web Server.
# Screenshots

The following screenshots document the key stages of this hands-on EC2 deployment.

### 1. Starting Point

The AWS re/Start lab was adapted for a personal AWS account, allowing the same learning objectives to be practiced independently.

![Starting point](screenshots/1.Start%20Point.png)

### 2. Lab Documentation

The lab was documented in GitHub as part of my AWS learning journey.

![Lab README](screenshots/2.Lab%201%20ReadMe.png)

### 3. Launching the EC2 Instance

The EC2 instance was configured using Amazon Linux 2023 and the initial `t3.micro` instance type.

![Launching EC2](screenshots/3.Launch%20Instance.png)

### 4. Selecting the Instance Type

The initial instance type selected was `t3.micro`.

![Instance type](screenshots/4.Instance%20Type.png)

### 5. EC2 Instance Running

The instance successfully launched and passed its available status checks.

![Instance running](screenshots/5.Instance%20Running.png)

### 6. Testing Before HTTP Access

Before adding an HTTP rule to the security group, the web server could not be reached through its public IP address.

![Before HTTP access](screenshots/6.Before%20HTTP.png)

### 7. Web Server Successfully Accessible

After allowing HTTP traffic on TCP port 80, the Apache web server successfully displayed the test page.

![Hello from server](screenshots/7.Hello%20from%20server.png)

### 8. EC2 Instance Screenshot

The EC2 console's instance screenshot feature was used as part of the monitoring and troubleshooting process.

![EC2 instance screenshot](screenshots/8.Instance%20Screenshot.png)

### 9. EC2 Monitoring

The Monitoring tab was used to review the instance's performance metrics.

![EC2 monitoring](screenshots/9.Monitoring.png)

### 10. Instance Type Changed

The EC2 instance was resized from `t3.micro` to `t3.small`.

![Instance type changed](screenshots/10.Instace%20Type%20changed.png)

### 11. EBS Volume Changed

The attached EBS volume was resized from `8 GiB` to `10 GiB`.

![EBS volume changed](screenshots/11.Volume%20changed.png)

### 12. Termination Protection

An initial termination attempt was blocked because termination protection was enabled.

![Failed termination](screenshots/12.Failed%20termination.png)

### 13. Termination Protection Removed

Termination protection was disabled after confirming that it successfully prevented accidental termination.

![Termination protection removed](screenshots/13.Termination%20removed.png)

### 14. EC2 Instance Terminated

After termination protection was disabled, the EC2 instance was successfully terminated, completing the lab.

![Instance terminated](screenshots/14.Terminated.png)
