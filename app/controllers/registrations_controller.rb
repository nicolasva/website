class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :login
    devise_parameter_sanitizer.for(:sign_up) << :login
  end


  def after_sign_up_path_for(user)
    return super(user) unless user.advertiser_wish 
    flash[:error] = t('registrations.advertiser_wish')
    admin_title_index_path
  end


  def after_sign_in_path_for(user)
    return super(user) unless user.advertiser_wish 
    flash[:error] = t('registrations.advertiser_wish')
    admin_title_index_path
  end

  def after_update_path_for(user)
    admin_title_index_path
  end
end
