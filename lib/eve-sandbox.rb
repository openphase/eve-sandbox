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
result.characters.each{|character|
	print "#{character.name} is part of #{character.corporationName} #{nameFix(character.allianceName)}\n"
	print "The image would be found at https://image.eveonline.com/Character/#{character.characterID}_256.jpg\n"
}