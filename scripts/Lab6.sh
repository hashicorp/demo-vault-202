cd /workstation/vault

vault token create -policy=autounseal -format=json | jq -r ".auth.client_token" > lab6-token.txt

echo "-------------------------------------------------------------------------------------------"
echo -e "Set $(cat lab6-token.txt) as the token value in vault2_config.hcl and vault3_config.hcl"
echo "-------------------------------------------------------------------------------------------"
