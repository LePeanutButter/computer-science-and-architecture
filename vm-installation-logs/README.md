# VM Installation Log

This directory contains the installation logs of various virtual machines set up during the course. The logs document the installation and configuration of different operating systems on virtual machines, using tools such as **VirtualBox** and **VMware Workstation**. The systems installed include **Slackware Linux**, **Windows Server**, and **Solaris**.

## Objectives

1. **Familiarize students with virtualization systems:**
    - VirtualBox for Slackware Linux installation.
    - VirtualBox for Windows Server installation.
    - VMware Workstation for Solaris installation.
  
2. **Learn how to install operating systems and configure network settings:**
    - Perform minimum installations of Linux and Windows Server without graphical interfaces.
    - Set up network interfaces, assign IPs, and configure DNS, gateway, etc., according to specified parameters.

3. **Network Configuration and Testing:**
    - Establish network connectivity using a bridged network mode.
    - Perform ping tests to verify network functionality and internet connectivity.

## Installation Logs for Virtual Machines

### 1. Slackware Linux Installation (VirtualBox)
- **Objective:**
    - Configure a VM with 700 MiB of memory and 3 GiB of disk space.
    - Install the minimal Slackware distribution with a 1.5 GiB swap partition and 1.5 GiB Linux partition.
    - Set up a bridged network and configure network settings (IP: 10.2.77.X, Mask: 255.255.0.0, Gateway: 10.2.65.1, DNS: 10.2.65.61).
    - Perform connectivity tests (ping 10.2.65.1, ping 8.8.8.8, ping www.google.com).
- **Log:** Contains detailed steps of Slackware installation and configuration of network settings.

### 2. Windows Server Installation (VirtualBox)
- **Objective:**
    - Set up a VM with Windows Server (without GUI).
    - Assign network settings (IP: 10.2.77.X, Mask: 255.255.0.0, Gateway: 10.2.65.1, DNS: 10.2.65.61).
    - Perform connectivity tests (ping 10.2.65.1, ping 8.8.8.8, ping www.google.com).
    - Perform the installation of Windows Server with and without the graphical interface.
    - Create three users and assign different permissions.
- **Log:** Document the installation and configuration process, including user creation and permissions assignment.

### 3. Solaris Installation (VMware Workstation)
- **Objective:**
    - Configure a VM with 1.5 GiB of memory and 6 GiB of disk space.
    - Install Solaris with a 1.5 GiB swap partition and a 4.5 GiB filesystem partition.
    - Set up network settings (IP: 10.2.77.X, Mask: 255.255.0.0, Gateway: 10.2.65.1, DNS: 10.2.65.61).
    - Perform connectivity tests (ping 10.2.65.1, ping 8.8.8.8, ping www.google.com).
- **Log:** Provides details on Solaris installation and network configuration, including connectivity tests.

## Key Configuration Details

- **IP Configuration:**
    - IP Address: 10.2.77.X (replace X with your specific machine number)
    - Subnet Mask: 255.255.0.0
    - Gateway: 10.2.65.1
    - DNS: 10.2.65.61

- **Ping Tests:**
    - Ping the gateway: `ping 10.2.65.1`
    - Ping an external server: `ping 8.8.8.8`
    - Ping Google: `ping www.google.com`

## How to Access the Logs

1. Navigate to the relevant PDF file for each operating system (Slackware, Windows Server, or Solaris) to view step-by-step instructions and details about the installation and configuration process.
2. These logs are useful for understanding the setup process, troubleshooting, and verifying network connectivity after installation.