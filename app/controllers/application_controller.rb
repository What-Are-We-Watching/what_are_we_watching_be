class ApplicationController < ActionController::API
  # disable the web based csrf protection.
  # protect_from_forgery with: :null_session
end
