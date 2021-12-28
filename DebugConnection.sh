# this script is designed to help debug access problems with kerberos and ssh
# H. Schellman 2021-12-28
# run it by doing
# source DebugConnection.sh
#
logname="ConnectTest_"`eval date +%Y%m%d_%H.%M.%S`".log"
echo "output will go to "$logname

# what os version
echo "----------------------------------------" >> $logname
echo " OS version " >> $logname
sw_vers  >> $logname

# look at ssh
echo "----------------------------------------" >> $logname
echo " ssh configuration " >> $logname
echo "> which ssh " >> $logname
which ssh >> $logname
echo "> which scp " >> $logname
which scp >> $logname
echo "> ls $HOME/.ssh" >> $logname
ls $HOME/.ssh >> $logname
echo "> cat $HOME/.ssh/config" >> $logname
cat $HOME/.ssh/config >> $logname
echo "> cat /etc/ssh/ssh_config" >> $logname
cat /etc/ssh/ssh_config >> $logname
echo "----------------------------------------" >> $logname
echo " kerberos configuration " >> $logname
# look at kerberos
echo "> which kinit" >> $logname
which kinit >> $logname
echo "> klist" >> $logname
klist >> $logname
echo "> cat /etc/krb5.conf" >> $logname
cat /etc/krb5.conf >> $logname

# are they using conda
echo "----------------------------------------" >> $logname
echo " using conda?" >> $logname
echo "> which conda" >> $logname
which conda >> $logname


# look at user setup
echo "----------------------------------------" >> $logname
echo "> cat $HOME/.profile " >> $logname
cat $HOME/.profile >> $logname

echo " please send the file "$logname$" as part of the service ticket"

