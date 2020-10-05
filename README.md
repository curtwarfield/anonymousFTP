# anonymousFTP
A [vsftpd](https://security.appspot.com/vsftpd.html) bash installer script to install and configure an anonymous FTP server for [Fedora](https://getfedora.org/), [CentOS](https://www.centos.org/),[Red Hat Enterprise Linux](https://www.redhat.com),   and other RPM based distros.

## Assumptions

The installer script makes the following assumptions:
 - You are running a version of **Fedora**, **CentOS**, or **Red Hat Enterprise Linux** that uses `systemd`.
 - You are currently running `firewalld`.

## Usage

First, grab the script and make it executable:

`curl -O https://raw.githubusercontent.com/curtwarfield/anonymousFTP/master/anonymousvsftp-install.sh`   
`chmod +x anonymousvsftp-install.sh`

Then run it as sudo or root:

`./anonymousvsftp-install.sh`

The installer script configures `/var/ftp/pub` as the default FTP directory. This is the location to store the files that will be available for download.

This is a pre-beta release. New features and enhancements will be introduced in the future.

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

## License 
![MIT License](license-MIT-green.svg)

This project is under the [MIT License](https://raw.githubusercontent.com/curtwarfield/anonymousFTP/master/LICENSE).
