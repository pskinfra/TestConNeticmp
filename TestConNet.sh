#!/bin/bash
#tleite@bsd.com.br

export smtpemailfrom=xxx@xxx.com.br
export smtpserver=smtp.xxx.com.br
export smtplogin=xxx@xxxx.com.br
export smtppass=xxxxx
export toemail=xxxxx@xxxxx.com.br
export subjet="CONEXAO INACESSIVEL - INTERNET"

ping -w1 -c 1 4.2.2.2 | grep icmp_seq

if [ $? -eq 0 ];then
echo "conexao ok" > /dev/null
else
       echo " CONEXAO INACESSIVEL - Data $(date)" >> /var/log/logNET.txt ;
cat /var/log/logcinbesa.txt | /usr/bin/sendEmail -f $smtpemailfrom -t $toemail  -u $subjet  -s $smtpserver:587 -xu $smtplogin -xp $smtppass ;
echo "enviado email"
fi
