#! /bin/ksh 
API_KEY=$1
API_SECRECT=$2

chk_pip=$(which pip > /dev/null 2>&1; echo $?)
chk_coinbase=$(python -c "import coinbase" > /dev/null 2>&1; echo $?)

cd
COINBASE_DIR=$(pwd)/coinbase

if [[ -z $API_KEY ]] || [[ -z $API_SECRECT ]]; then 
	echo Must have api_key and api_secrect as input
	echo Usage $0 api_keyxxxxx api_secrectxxxxx
	exit 0
fi

if [[ ! -d $COINBASE_DIR ]]; then 
	mkdir $COINBASE_DIR
fi

cd $COINBASE_DIR

if [[ $chk_pip -ne 0 ]]; then 
	echo "Please install pip first"
	exit 0
fi	

if [[ $chk_coinbase -eq 0 ]]; then
	echo "coinbase is installed"
	python example.py $API_KEY $API_SECRECT 
else 
	sudo pip install coinbase
fi 

