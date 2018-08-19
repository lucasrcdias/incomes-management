module API::V1
  class SessionsController < API::V1::BaseController
    skip_before_action :authenticate!

    def new
      user = User.find_by(email: user_params[:email])

      if user.present?
        user = user.authenticate(user_params[:password])

        if user
          render json: { token: JsonWebToken.encode({ user_id: user.id }) }, status: :authorized and return
        end
      end

      render json: { errors: { password: [I18n.t('activerecord.errors.models.session.incorrect_password')] } }, status: :unauthorized
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
