#!/bin/bash

auditctl_function()
{
	sudo echo "-D" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-b 8192" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-f 1" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/selinux/ -p wa -k MAC-policy" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a exit,always -F arch=b64 -S execve" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a exit,always -F arch=b32 -S execve" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S sethostname,setdomainname -F key=audit_rules_networkconfig_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S sethostname,setdomainname -F key=audit_rules_networkconfig_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/issue -p wa -k audit_rules_networkconfig_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/issue.net -p wa -k audit_rules_networkconfig_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/hosts -p wa -k audit_rules_networkconfig_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /var/run/utmp -p wa -k session" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /var/log/btmp -p wa -k session" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /var/log/wtmp -p wa -k session" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/sudoers -p wa -k actions" | sudo tee -a /etc/audit/rules.d/zee_auditctl.rules;
	sudo echo "-w /etc/sudoers.d/ -p wa -k actions" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/group -p wa -k audit_rules_usergroup_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/gshadow -p wa -k audit_rules_usergroup_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/security/opasswd -p wa -k audit_rules_usergroup_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/passwd -p wa -k audit_rules_usergroup_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/shadow -p wa -k audit_rules_usergroup_modification" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S fremovexattr -S fsetxattr -S lremovexattr -S lsetxattr -S removexattr -S setxattr -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S fremovexattr -S fsetxattr -S lremovexattr -S lsetxattr -S removexattr -S setxattr -F auid>=1000 -F auid!=unset -F key=perm_mod" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S rename -S renameat -S unlink -S unlinkat -F auid>=1000 -F auid!=unset -F key=delete" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S rename -S renameat -S unlink -S unlinkat -F auid>=1000 -F auid!=unset -F key=delete" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S creat -S ftruncate -S open -S openat -S truncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=access" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S creat -S ftruncate -S open -S openat -S truncate -F exit=-EACCES -F auid>=1000 -F auid!=unset -F key=access" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S creat -S ftruncate -S open -S openat -S truncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=access" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S creat -S ftruncate -S open -S openat -S truncate -F exit=-EPERM -F auid>=1000 -F auid!=unset -F key=access" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S delete_module -F auid>=1000 -F auid!=unset -F key=module-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S delete_module -F auid>=1000 -F auid!=unset -F key=module-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S init_module -F auid>=1000 -F auid!=unset -F key=module-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S init_module -F auid>=1000 -F auid!=unset -F key=module-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /var/run/faillock -p wa -k logins" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /var/log/lastlog -p wa -k logins" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /sbin/insmod -p x -k modules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /sbin/modprobe -p x -k modules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /sbin/rmmod -p x -k modules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -F key=audit_time_rules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -F key=audit_time_rules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b32 -S clock_settime -F a0=0x0 -F key=time-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-a always,exit -F arch=b64 -S clock_settime -F a0=0x0 -F key=time-change" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/localtime -p wa -k audit_time_rules" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-e 2" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /opt/traps -p wa -k cortex-files-watcher" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /etc/panw -p wa -k cortex-files-watcher" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo echo "-w /opt/rapid7 -p wa -k rapid7-files-watcher" | sudo tee -a /etc/audit/rules.d/auditctl.rules;
	sudo chmod 640 /etc/audit/rules.d/zee_auditctl.rules;
	sudo augenrules --load;
	sudo systemctl restart auditd.service;
}

sudo timedatectl set-timezone Asia/Kolkata;
echo "export HISTTIMEFORMAT=\"[%c] [\`whoami\`] \"" | sudo tee -a /etc/bash.bashrc;
wget -q https://github.com/ComplianceAsCode/content/releases/download/v0.1.71/scap-security-guide-0.1.71.zip;
unzip -q scap-security-guide-0.1.71.zip;
sudo oscap xccdf eval --profile xccdf_org.ssgproject.content_profile_cis_level2_server --fetch-remote-resources --results ~/Ubuntu2204-CIS-L2-Before-Hardening-No-ARF-Result.xml --report ~/Ubuntu2204-CIS-L2-Before-Hardening-Report-`date +%d%m%Y`.html ~/scap-security-guide-0.1.71/ssg-ubuntu2204-ds.xml;
sudo oscap xccdf generate fix --fix-type ansible --fetch-remote-resources --output ~/Ubuntu2204-CIS-L2-Hardening-Playbook.yml --result-id xccdf_org.ssgproject.content_profile_cis_level2_server ~/Ubuntu2204-CIS-L2-Before-Hardening-No-ARF-Result.xml;
sudo ansible-playbook -i "localhost," ~/Ubuntu2204-CIS-L2-Hardening-Playbook.yml --connection=local;
sudo mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db;
sudo echo "5 8 * * 0 /usr/bin/aide --check --config /etc/aide/aide.conf" | sudo crontab -;
auditctl_function;
sudo rm -rf ~/*.html ~/*.xml ~/*.yml;
sudo rm -rf ~/scap-security-guide-0.1.71*;
