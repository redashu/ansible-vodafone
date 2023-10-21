# ansible-vodafone

### Using lineinfile to delete / add line 

```
---
- hosts: 192.168.100.2 
  become: true
  tasks:
  - name: Installing software
    yum: 
     name: httpd
     state: present 


  - name: adding line in the last of file 
    lineinfile:
     path: /etc/httpd/conf/httpd.conf 
     line: "LogLevel debug"
     state: absent  #  absent 

```

### Replacing in a file 

```
---
- hosts: 192.168.100.2 
  become: true
  tasks:
  - name: Installing software
    yum: 
     name: httpd
     state: present 


  - name: adding line in the last of file 
    lineinfile:
     path: /etc/httpd/conf/httpd.conf # + one or more 
     regexp: '^LogLevel\s+warn'  # ^ means it will check only those keywords which will be in the starting of theline 
     line: "LogLevel debug"
```

