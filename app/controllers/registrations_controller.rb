class RegistrationController < Devise::RegistrationController

  private

  #Modified Devise params for user login
  def sign_up_params
    params.require(:user).permit(:name, :birthday)
  end
end
