# Creates a new directory at /home/rcvault with the name provided
# for the company and creates 2 standard users
 
if [ "$#" -ne 2 ]; then
   echo "Type following the example: ./CreateAccounts company_name mail_    address"
   exit 1;
fi
 
if [ ! -d /home/rcvault ]; then mkdir /home/rcvault; fi
chmod 755 /home/rcvault
 
cd /opt/rcvaultadmin
 
company=$1
mail_address=$2
 
# Creates company's groups
groupadd $company\_admin
groupadd $company\_out
 
# Creates company's "home" dir
mkdir -p /home/rcvault/$company
mkdir -p /home/rcvault/$company/admin
mkdir -p /home/rcvault/$company/admin/in
mkdir -p /home/rcvault/$company/admin/out
mkdir -p /home/rcvault/$company/out
chgrp $company\_admin /home/rcvault/$company
chgrp $company\_admin /home/rcvault/$company/admin -R
chgrp $company\_out /home/rcvault/$company/out
chmod 750 /home/rcvault/$company -R
chmod 770 /home/rcvault/$company/admin/out
chmod 750 /home/rcvault/$company/out
 
 
 # Adding users 
mkdir -p /home/$company/admin
mkdir -p /home/$company/out
useradd -g $company\_admin $company\_admin --home-dir /home/$company/admin
pass_admin=`date +%s%N | sha256sum | base64 | head -c 10 ; echo`
echo $pass_admin
echo $pass_admin | passwd $company\_admin --stdin
useradd -g $company\_out $company\_out --home-dir /home/$company/out
pass_out=`date +%s%N | sha256sum | base64 | head -c 10 ; echo`
echo $pass_out
echo $pass_out | passwd $company\_out --stdin
# Command to send the email
echo -e "To: ${mail_address}\nSubject:EC2 - Welcome to sftp from billing\nGre    atings fellows, you were granted access to sftp system, please don't share th    is credentials.\n\n\nCompany_admin: "$company"_admin \nPassword: "$pass_admin    "\n\nCompany_out: "$company"_out\nPassword: "$pass_out"" > mail.txt
ssmtp ${mail_address} < mail.txt
 
echo "Email sent with success to $mail_address"
 
# Creating template config files
sed "s/COMPANY/$company/g"  user.template > $company.user.conf
cat  $company.user.conf >> /etc/ssh/sshd_config
service sshd restart
 
# Adding new user/password created to database
mysql -u root -ppea881tour384 -e "use sftpdb;
 
insert into rcvault (user,password) values ('$company\_admin','$pass_admin');
insert into rcvault (user,password) values ('$company\_out','$pass_out');"
echo -e "Users $company\_admin e $company\_out added with success to database     sftpdb"
