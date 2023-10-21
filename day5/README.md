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

## using one more example 

```
[ashu@ip-172-31-93-233 day5-final]$ cat  jinja_examples/use_car.j2 
{% for i  in  cars  %}
   <h1>  {{ i }}  </h1> 

{% endfor %}
[ashu@ip-172-31-93-233 day5-final]$ 
[ashu@ip-172-31-93-233 day5-final]$ cat  group_vars/ashu_extras 
cars:
 - maruit
 - bmw
 - honda
 - kia 
[ashu@ip-172-31-93-233 day5-final]$ cat  for_jinja_play.yaml 
---
- hosts: ashu_extras
  become: true
  tasks:
  - name: starting httpd
    service: 
     name: httpd
     state: started
  - name: using jinja template 
    template: 
     src: jinja_examples/use_car.j2
     dest: /var/www/html/car.html 

```

### creating config file using jinja template 

```
[ashu@ip-172-31-93-233 day5-final]$ cat  jinja_examples/ashu_httpd.j2 
<virtualhost *:{{ http_port }}>
   servername  {{ ansible_hostname }}
   documentroot {{ location  }}

</virtualhost>
[ashu@ip-172-31-93-233 day5-final]$ 
[ashu@ip-172-31-93-233 day5-final]$ cat  for_jinja_play.yaml 
---
- hosts: ashu_extras
  become: true
  tasks:
  - name: starting httpd
    service: 
     name: httpd
     state: started
  - name: using jinja template 
    template: 
     src: jinja_examples/use_car.j2
     dest: /var/www/html/car.html 
       
  - name: using jinja template  to create new apache httpd conf file 
    template: 
     src: jinja_examples/ashu_httpd.j2
     dest: /etc/httpd/conf.d/ashu_httpd.conf 
```



