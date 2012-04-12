#!/bin/bash

#Import configuration
. conf

#Questions
QDOMAIN="What Domain?"
QOUTPUT="JSON or XML?"

function input_domain() {
echo "$QDOMAIN"
        read domain
        echo "$QOUTPUT"
        read output
}

echo "What tool do you want to run?"
echo -e "Propagation[p]\nChinese Firewall Test [c]\n"
read tool

if [ $tool == 'propagation' ] || [ $tool == 'p' ]; then
	input_domain
		GET "http://pro.viewdns.info/propagation/?domain=$domain&apikey=$APIKEY&output=$output"

elif [ $tool == 'c' ]; then
	input_domain
		GET "http://pro.viewdns.info/chinesefirewall/?domain=$domain&apikey=$APIKEY&output=$output"
fi
