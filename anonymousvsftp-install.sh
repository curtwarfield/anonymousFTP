#!/bin/bash
#This is a pre-beta release to show proof of concept

#Install vsftpd
yum install vsftpd -y

#Backup the original vsftpd.conf file 
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.anonymousFTP.bak

#Create the vsftpd configuration file for an anonymous FTP server
echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_upload_enable=NO" >> /etc/vsftpd/vsftpd.conf
echo "hide_ids=YES" >> /etc/vsftpd/vsftpd.conf
echo "anon_root=/var/ftp/pub/" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd/vsftpd.conf
echo "pasv_max_port=40001" >> /etc/vsftpd/vsftpd.conf

#Enable and start the vsftpd service
systemctl enable vsftpd
systemctl start vsftpd
