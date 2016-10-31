# Removes previously created accounts

if [ -z "$1" ]; then
	echo "Usage: removeAccounts company_name"
	exit 1;
fi

#if [ ! -f /opt/rcvaultadmin/$1.user.conf ]; then
#	echo "Company does not seem to exist"
#	exit 1;
#fi

cd /opt/rcvaultadmin

company=$1

# removes users
userdel $company\_admin 
userdel $company\_out 

# removes company's groups
groupdel $company\_admin
groupdel $company\_out

# removes company's "home" dir
rm -fR /home/rcvault/$company
rm -fR /home/tgambogi/rcvault/$company/

# removes template config files
rm  $company.user.conf
cat sshd_config.template > /etc/ssh/sshd_config
cat *.user.conf >> /etc/ssh/sshd_config
service sshd restart


# Command to send the email
echo -e "To: admin@easytaxi.com.br\nSubject:EC2 - Users removed in sftp from billing\nHello Admin, the users was removed from rcvault server. \n\n\nuser_admin: "$company"_admin \n\nuser_out: "$company"_out " > maildel.txt
ssmtp admin@easytaxi.com.br < maildel.txt



# Removing the users and passwords in the database
mysql -u root -ppea881tour384 -e "use sftpdb;

DELETE FROM rcvault WHERE user='$company\_admin';
DELETE FROM rcvault WHERE user='$company\_out';"

echo -e "Users $company\_admin and $company\_out removed with success to database sftpdb"
