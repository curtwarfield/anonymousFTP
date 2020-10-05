# anonymousFTP
A vsftpd installer to install and configure an anonymous FTP server for Fedora, CentOS, and Red Hat Enterprise Linux.

## Usage

First, get the script and make it executable:

`curl -O https://raw.githubusercontent.com/curtwarfield/anonymousFTP/master/anonymousvsftp-install.sh`   
`chmod +x anonymousvsftp-install.sh`

Then run it as sudo or root:

`./anonymousvsftp-install.sh`

This beta release is extremely limited and for proof of concept. New features and enhancements will be introduced in the future.

## Current Feature List

- Installs and configures vsftp as an anonymous FTP server
- Enables and starts vsftpd
- Backs up the original vsftpd.conf file
- Configures a passive port range
- Configures firewalld
- Shows the vsftpd status after completion

## Upcoming Feature List

- Check for the presence of vsftp before installation
- Check for supported distros
