class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	# # if user_signed_in?
	# # 	redirect_to blogs_url
	# # else
	# # 	redirect_to welcome_index_path
	# # end
	# before_action :configure_permitted_parameters, if: :devise_controller?
	# binding.pry
 #    protected

 #        def configure_permitted_parameters
        	
 #            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
 #            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password) }
 #        end
end
