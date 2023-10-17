## Problem with sysadmin to hanlde server on a large scale 

### Using scripting methods 

<img src="scr.png">

### Scripting problem 

<img src="scr1.png">

## Introduction to Ansible and why to use it 

<img src="ansible1.png">

### Installation -- on Linux platform -- Opensource ansible -- Install / configure EPEL repo on your system 

```
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install ansible
```

### Verify 

```
rpm -q ansible
ansible-2.9.27-1.el7.noarch
```
### checking config File 

```
[ashu@ip-172-31-93-233 ~]$ rpm -qc  ansible
/etc/ansible/ansible.cfg
/etc/ansible/hosts
```
