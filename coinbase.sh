#! /bin/ksh 
STATUS=$1

function generate_c_file {
	INPUT=$1
	KEY=$2
	DIR=$3

	echo "#include<stdio.h>" > $DIR/temp.c
	echo "int main() {" >> $DIR/temp.c
	echo "	printf(\"$INPUT\\n\");" >> $DIR/temp.c 
	echo "}" >> $DIR/temp.c
	gcc -o $KEY $DIR/temp.c
	rm -f $DIR/temp.c  
}

################# MAIN #######################

if [[ $STATUS == "install" ]]; then 
	API_KEY=$2
	API_SECRECT=$3

	chk_pip=$(which pip > /dev/null 2>&1; echo $?)
	chk_coinbase=$(python -c "import coinbase" > /dev/null 2>&1; echo $?)

	cd
	COINBASE_DIR=$(pwd)/coinbase

	if [[ -z $API_KEY ]] || [[ -z $API_SECRECT ]]; then 
		echo Must have api_key and api_secrect as input
		echo Usage $0 install api_keyxxxxx api_secrectxxxxx
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
	
	generate_c_file $API_KEY API_KEY "$COINBASE_DIR"
	generate_c_file $API_SECRECT API_SECRECT "$COINBASE_DIR"
	
	if [[ $chk_coinbase -eq 0 ]]; then
		echo "coinbase is installed"
		python example.py $($COINBASE_DIR/API_KEY) $($COINBASE_DIR/API_SECRECT) 
	else 
		sudo pip install coinbase
	fi 
fi
