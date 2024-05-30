class ApplicationController < ActionController::API
  include Pagy::Backend

  # Because It is an API and it is not using cookies
  # I am going to simulate something loke JWT
  def log_in(user)
    user.generate_jwt
  end

  def current_user
    @current_user ||= User.find_by(jwt: get_token_from_headers)
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def get_token_from_headers
    request.authorization.split(" ").last
  end
end
