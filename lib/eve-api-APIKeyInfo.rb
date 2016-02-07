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
result = api.APIKeyInfo
print result.key.attribs["accessMask"]
result.key.container.keys.each do |k|
	print k.value
end