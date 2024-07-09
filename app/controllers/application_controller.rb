class ApplicationController < ActionController::Base
    before_action :configue_premitted_parameters, if: :devise_controller?

    protected

    def configue_premitted_parameters()
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
        devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end
end
