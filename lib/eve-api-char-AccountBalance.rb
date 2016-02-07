
require "eaal"
require "pp"
require "./api-keys"

def nameFix(cn)
	if cn == ''
		return "which is not part of an alliance"
	else
		return "which is part of the #{cn}"
	end
end

api = EAAL::API.new(API_KEYID_ACCOUNT, API_VCODE_ACCOUNT)
result = api.Characters
characterIDS = Hash.new
result.characters.each{|character|
	#characterID
	#name
	characterIDS[character.name] = character.characterID
}

pp characterIDS

characterIDS.keys.each do |k|
	api = EAAL::API.new(API_KEYID_ACCOUNT,API_VCODE_ACCOUNT, API_SCOPE_CHARACTER)
	result = api.AccountBalance("characterID" => characterIDS[k].to_s)
	pp result
	#pp api
	print "Character Name: #{k} Balance: #{result.accounts[0].balance}\n"
end
