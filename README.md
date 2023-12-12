[elasticsearch]
name=Elasticsearch repository for 8.x packages
baseurl=https://artifacts.elastic.co/packages/8.x/yum
gpgcheck=0
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

<!-- - name:  Copying config file
  ansible.builtin.template:
   src: filebeat.yml
   dest: /etc/filebeat/filebeat.yml

- name: restarting filebeat file
  ansible.builtin.systemd:
   name: filebeat
   state: restarted
   enabled: yes -->