# ansible-vodafone

### Revision --

<img src="rev.png">

### testing adhoc command 

```
ashu@ip-172-31-93-233 playbooks]$ cat hosts 
[ashu_apps]
192.168.100.2
192.168.101.2
[ashu@ip-172-31-93-233 playbooks]$ ansible  ashu_apps -m ping 
192.168.101.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.100.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
[ashu@ip-172-31-93-233 playbooks]$ ansible  ashu_apps -m command -a date
192.168.101.2 | CHANGED | rc=0 >>
Wed Oct 18 05:02:38 UTC 2023
192.168.100.2 | CHANGED | rc=0 >>
Wed Oct 18 05:02:38 UTC 2023

```

### targeting all the groups 

```
[ashu@ip-172-31-93-233 playbooks]$ cat  hosts 
[ashu_apps]
192.168.100.2
192.168.101.2


[ashu_common]
192.168.100.70
192.168.101.70
[ashu@ip-172-31-93-233 playbooks]$ ansible  ashu_apps,ashu_common -m ping 
192.168.100.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.101.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.100.70 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.101.70 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
[ashu@ip-172-31-93-233 playbooks]$ ansible  all  -m ping 
192.168.101.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.101.70 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.100.70 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
192.168.100.2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}

```

