green=`tput setaf 2`
reset=`tput sgr0`

run_cmd() {
        cmd="$1";
        if [[ $cmd != *"private-key"* ]]; then
            echo -e "\n\n >> ${green} Next command: $1 \n\n ${reset}";
        fi
        #wait;
        #read -p "Press enter to continue ${reset}";
        eval "cleos --wallet-url $WALLET_URL -u $API_URL $1";
}

create_act() {
  creator="$1"
  act="$2"
  key="$3"
  eval "cleos --wallet-url $WALLET_URL -u $API_URL system newaccount --stake-cpu \"5.0000 EOS\" --stake-net \"1.0000 EOS\" --transfer --buy-ram-kbytes 2048 $creator $act $key"
}

sed_compatible() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    eval 'sed -i "" $1 $2'
  else
    eval "sed -i $1 $2"
  fi
}
