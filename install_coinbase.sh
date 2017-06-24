#! /bin/ksh 

chk_pip=$(which pip > /dev/null 2>&1; echo $?)
chk_coinbase=$(python -c "import coinbase" > /dev/null 2>&1; echo $?)

cd
COINBASE_DIR=$(pwd)

if [[ $chk_pip -ne 0 ]]; then 
	echo "Please install pip first"
	exit 0
fi	

if [[ $chk_coinbase -eq 0 ]]; then
	echo "coinbase is installed"
else 
	sudo pip install coinbase
fi 

