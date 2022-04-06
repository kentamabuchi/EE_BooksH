class ApplicationController < ActionController::Base
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :search_data, :get_path, :check_action
    before_action :authenticate_user!,except: [:top, :index, :show]
    

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
    
    def after_sign_in_path_for(resource)
        case resource
            when Admin
              admin_top_path          
            when User
              books_path              
        end
    end
    
    def after_sign_out_path_for(resource_or_scope)
        if resource_or_scope == :admin
            new_admin_session_path
        else
            root_path
        end
    end
    
    def check_action
        unless controller_name == 'books' && action_name == 'index' || action_name == 'show'
            true
        end
    end
    
    
    def search_data
        @q = Book.ransack(params[:q])
        @search_books = @q.result(distinct: true)
        @user = User.new
    end
    
    def get_path
        @path = request.fullpath
    end
    
end
