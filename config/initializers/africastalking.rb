require "africastalking"

username = "chris_siku"
api_key = "aee5db577d1dbd8bbe8d733f8837f328fd775facc87e7b66e1818d60b4dda375"

# AfricasTalking.api_key = api_key
# AfricasTalking.username = username
AfricasTalking::Initialize.new(username, api_key)
