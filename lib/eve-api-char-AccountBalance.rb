
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

API_KEYS.keys.each do |key| 
	api = EAAL::API.new(API_KEYS[key][:apikeyid], API_KEYS[key][:apivcode])
	result = api.Characters
	characterIDS = Hash.new
	result.characters.each do |c|
		characterIDS[c.name] = c.characterID
		print "Character Name: #{c.name} Character ID: #{c.characterID}\n"		
	end
end

characterIDS.keys.each do |k|
	api = EAAL::API.new(API_KEYID_ACCOUNT,API_VCODE_ACCOUNT, "Char")
	result = api.AccountBalance("characterID" => characterIDS[k].to_s)

	print "Character Name: #{k} Balance: #{result.accounts[0].balance}\n"
end
