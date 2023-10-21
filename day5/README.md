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

### adding file 

```
---
- hosts: all
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
    when: ansible_hostname == "centos2"




  - name: adding line 
    lineinfile:
     path: /etc/hosts # + one or more 
     line: "192.168.100.3  ashunode3"
    when: ansible_hostname ==  "vodafone1"


```

### jinja template 

ashu_msg.j2
```
this is my ansible target having value {{ ansible_hostname }}
```

### using in playbook 

```
---
- hosts: all
  become: true
  tasks:
  - name: using jinja template 
    template: 
     src: jinja_examples/ashu_msg.j2
     dest: /etc/motd

```



