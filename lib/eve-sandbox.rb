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

API_KEYS.keys.each do |k|
  api = EAAL::API.new( API_KEYS[k][:apikeyid], API_KEYS[k][:apivcode])
  char_api= api.Characters
  char_api.characters.each do |char|
    print "Character Name: #{char.name} Character ID: #{char.characterID}\n"
    print "Avatar Image: https://image.eveonline.com/Character/#{char.characterID}_256.jpg\n"
  end

end

