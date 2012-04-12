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
echo -e "\nPropagation [p]\nChinese Firewall Test [c]\nRecord Lookup [r]\nPort Scanner [ps]"
read tool

if [ $tool == 'propagation' ] || [ $tool == 'p' ]; then
	input_domain
		GET "http://pro.viewdns.info/propagation/?domain=$domain&apikey=$APIKEY&output=$output"

elif [ $tool == 'c' ]; then
	input_domain
		GET "http://pro.viewdns.info/chinesefirewall/?domain=$domain&apikey=$APIKEY&output=$output"

elif [ $tool == 'record' ] || [ $tool == 'r' ]; then
	input_domain
		GET "http://pro.viewdns.info/dnsrecord/?domain=$domain&apikey=$APIKEY&output=$output"

elif [ $tool == 'port scanner' ] || [ $tool == 'ps' ]; then
	input_domain
		GET "http://pro.viewdns.info/portscan/?host=$domain&apikey=$APIKEY&output=$output"

fi
