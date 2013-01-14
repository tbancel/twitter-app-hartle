config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "fidbacks.com",
  :user_name            => "support@fidbacks.com",
  :password             => "123Soleil",
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}
  
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true