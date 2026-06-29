# Automated Resilient Ubuntu Web Server on AWS

An automated DevOps solution that deploys a highly available, secure Apache2 web server on an AWS EC2 Ubuntu instance. This configuration automatically decouples compute and state by linking web content directly to an independent, resilient Elastic Block Store (EBS) volume.

## 🚀 Key Features
* **Infrastructure-as-Code Bash Automation:** Installs, configures, and secures Apache2 with zero manual intervention via a custom `userdata.sh` deployment script.
* **Decoupled State Architecture:** Formats, structures, and mounts a separate persistent AWS EBS block storage volume directly to `/var/www/html`.
* **Self-Healing Properties:** Ensures the web directory mount survives system crashes, restarts, and reboots by automating system `fstab` entries.
* **Failsafe HTML Provisioning:** Dynamically handles block storage state verification, initializing custom target landing web pages seamlessly.

## 🏗️ System Architecture & Workflow
1.  **EC2 Instantiation:** AWS provisions a base Ubuntu Server LTS instance.
2.  **Storage Integration:** A secondary raw EBS volume (`/dev/xvdf`) is attached to provide persistent, isolated block storage.
3.  **Bootstrapping Execution:** The `userdata.sh` automation script triggers:
    * System package updates and Apache2 installation.
    * EBS partition layout verification.
    * Ext4 filesystem generation on the detached storage layer.
    * System runtime configuration updating inside `/etc/fstab`.
    * Live mount targeting, access controls, and web index generation.

---

## 🛠️ How to Deploy This Infrastructure

### 1. Prerequisites
* An active AWS Account with EC2 management permissions.
* The `userdata.sh` initialization script cloned from this repository.

### 2. AWS EC2 Launch Configuration
When launching your Ubuntu EC2 instance via the AWS Console or AWS CLI, ensure you configure the following properties:
* **Storage:** Click **Add new volume** to add a secondary EBS volume. Set the size (e.g., 10 GB) and note the device path (e.g., `/dev/sdf` or `/dev/xvdf`).
* **Advanced Details:** Scroll to the bottom to find the **User data** text box. Paste the entire contents of the `userdata.sh` script directly into the text field.
* **Security Group:** Ensure incoming traffic rules allow **HTTP (Port 80)** from anywhere (`0.0.0.0/0`) alongside your standard SSH management access.

---
*Developed as part of a cloud infrastructure automation portfolio exploring resilient Linux-based web hosting architectures.*
