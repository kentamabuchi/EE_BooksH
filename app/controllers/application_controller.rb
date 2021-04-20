class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :search_data
    
   
    
    protected
    
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name,
                                                               :email,
                                                               :created_at,
                                                               :updated_at])
            devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
            devise_parameter_sanitizer.permit(:account_ipdate, keys: [:nick_name,
                                                                      :email,
                                                                      :created_at,
                                                                      :updated_at])
        elsif resource_class == Admin
            devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
            devise_parameter_sanitizer.permit(:account_ipdate, keys: [:name,
                                                                      :email,
                                                                      :created_at,
                                                                      :updated_at])
        end
    end
    
    def search_data
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true)
    end
    
end
