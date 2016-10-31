# Autor: Leonardo Souza
# Email: leonardosilva.souza@yahoo.com.br

if [ "$#" -ne 2 ]; then
	echo "Type following the example: ./resetAccounts company_name mail_address (Remember: this will reset the password to both users: admin and out)"
        exit 1;
fi

company=$1
mail_address=$2

# Command to change the User Password
pass_admin=`date +%s%N | sha256sum | base64 | head -c 10 ; echo`
echo $pass_admin
echo $pass_admin | passwd $company\_admin --stdin

pass_out=`date +%s%N | sha256sum | base64 | head -c 10 ; echo`
echo $pass_out
echo $pass_out | passwd $company\_out --stdin


# Command to send the email
echo -e "To: ${mail_address}\nSubject:EC2 - Password reseted to access the sftp from billing\nHi there, like the requested, the password was reseted, please don't share this credentials.\n\n\nCompany_admin: "$company"_admin \nPassword: "$pass_admin"\n\nCompany_out: "$company"_out\nPassword: "$pass_out"" > mailreset.txt
ssmtp ${mail_address} < mailreset.txt
 
echo "Email sent with success to $mail_address"

#service sshd restart

#Save change to database

mysql -u root -ppea881tour384 -e "use sftpdb;
 
UPDATE Table rcvault set password='$pass_admin' WHERE user='$company\_admin';
UPDATE Table rcvault set password='$pass_out' WHERE user='$company\_out';"
 
echo -e "Users $company\_admin and $company\_out was update with success to database sft"
