class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  # devise利用の機能（ユーザ登録、ログイン認証など）が
  # 使われる前にconfigure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  # protectedは呼び出された他のコントローラからも参照できる
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

