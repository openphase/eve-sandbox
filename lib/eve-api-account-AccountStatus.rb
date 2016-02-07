require "eaal"
require "pp"
require "./api-keys"


api = EAAL::API.new(API_KEYID_ACCOUNT, API_VCODE_ACCOUNT)
result = api.AccountStatus

print result.paidUntil