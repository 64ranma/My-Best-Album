class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました。"
    posts_path
  end
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました。"
    root_path
  end
end
