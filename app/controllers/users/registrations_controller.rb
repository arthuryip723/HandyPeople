class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  alias :super_new :new
  alias :super_create :create

  def create
      super do |resource|
        # resource.add_role "admin"
        resource.add_role "user"
        # BackgroundWorker.trigger(resource)
      end
  end

  def create_handy
    super_create do |resource|
      # resource.add_role "handy"
      # add a role of handy_people to it.
      resource.add_role "handy"
      # add a handy profile entry to the new user
      profile = HandyProfile.new(handy_profile_params)
      # resource.merge(handy_profile: profile)
      resource.handy_profile = profile
    end
  end

  def new_handy
    # render :new_handy
    super_new do |resource|
    end
  end

  def new
      super do |resource|
      end
  end

  private
  def handy_profile_params
    params.require(:user).permit(:trade)
  end
end
