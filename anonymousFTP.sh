#This is a pre-beta release to show proof of concept

#Install vsftpd
yum install vsftpd -y

#Backup the original vsftpd.conf file 
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.anonymousFTP.bak

#Create the vsftpd configuration file for an anonymous FTP server specifiying  a port range of 40000-4001.
#Future revisions will interactively ask for the port range to use.
echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_upload_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "hide_ids=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_root=/var/ftp/pub/" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=40001" >> /etc/vsftpd/vsftpd.conf

#Enable and start the vsftpd service
systemctl enable vsftpd
systemctl start vsftpd

#Add the Firewalld rules to allow the port range of 40000-40001. Future revisions will interactively ask for the port range.
firewall-cmd --add-port=40000/tcp --perm > /dev/null 2>&1
firewall-cmd --add-port=40001/tcp --perm > /dev/null 2>&1
firewall-cmd --reload > /dev/null 2>&1

#Check status of vsftpd
systemctl status vsftpd
