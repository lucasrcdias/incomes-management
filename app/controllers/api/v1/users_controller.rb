module API::V1
  class UsersController < API::V1::BaseController
    skip_before_action :authenticate!, only: :create

    def create
      user = User.new(user_params)

      if user.save
        user.token = JsonWebToken.encode({ user_id: user.id })
        render json: user, status: :created
      else
        render json: { errors: user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
