def login
  user = create(:user, :password => 123)
  login_user(user)
  user
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before :each, :login do
    @loginned_user = login
  end
end
