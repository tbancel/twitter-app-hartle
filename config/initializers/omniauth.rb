Rails.application.config.middleware.use OmniAuth::Builder do

  #EbayAPI::EBAY_LOGIN_URL = "https://signin.sandbox.ebay.com/ws/eBayISAPI.dll"

  provider :developer unless Rails.env.production?
  #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :ebay, "Hadrien_Dorio-HadrienD-0116-4-waqlwcu", # ru_name
    "b76a5893-78f2-4b6e-b000-b28e042e8541", # dev_id
    "HadrienD-0116-4abe-8f73-f3c99bdb3e22", # app_id
    "7197a93e-b8e4-4c80-8533-88478a0eeb99", # cert_id
    "71", # site_id
    "https://api.ebay.com/ws/api.dll", # api_url
    "SignIn" # auth_type
  #provider :ebay, "Hadrien_Dorio-HadrienD-75ca-4-xcsppllj",
  #  "b76a5893-78f2-4b6e-b000-b28e042e8541",
  #  "HadrienD-75ca-4cc2-97f5-06170fc1f428",
  #  "d36b374c-d04e-4b3b-9f90-a413c841219f",
  #  "71",
  #  "https://api.sandbox.ebay.com/ws/api.dll"
end
