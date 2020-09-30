#This is a pre-beta release to show proof of concept

#Install vsftpd
yum install vsftpd -y  >/dev/null 2>&1

#Backup the original vsftpd.conf file 
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.anonymousFTP.bak
rm /etc/vsftpd/vsftpd.conf

echo
echo "The vsftpd package has been installed..."
echo

#Create the vsftpd configuration file for an anonymous FTP server
echo "We'll now configure the passive port range..."
echo
echo "Here are the current ports configured on your system..."
firewall-cmd --list-all
echo
echo
echo "Please choose ports that are not already in use..."
echo
read -p "Enter the minimum passive port number to use: " minpasv
read -p "Enter the maximum passive port number to use: " maxpasv
echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_upload_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "hide_ids=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_root=/var/ftp/pub/" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=$minpasv" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=$maxpasv" >> /etc/vsftpd/vsftpd.conf

echo
echo "The vsftpd configuration file has been created..."
echo

#Enable and start the vsftpd service
systemctl enable vsftpd  >/dev/null 2>&1
systemctl start vsftpd  >/dev/null 2>&1

echo
echo "The vsftpd service has been enabled and started..."
echo

#Add the Firewalld rules
firewall-cmd --add-service=ftp --perm  >/dev/null 2>&1
firewall-cmd --add-port=$minpasv/tcp --perm  >/dev/null 2>&1
firewall-cmd --add-port=$maxpasv/tcp --perm  >/dev/null 2>&1
firewall-cmd --reload >/dev/null 2>&1

echo
echo "The firewalld service has been configured for vsftpd..."
echo 

#Check status of vsftpd
VSFTPD=`systemctl is-active vsftpd`
if [[ $VSFTPD = "active" ]] 
then
echo "The vsftpd service has been successfully started..."
else
echo "There was a problem configuring and start vsftpd..."
fi

echo
