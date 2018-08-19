module API::V1
  class CategoriesController < API::V1::BaseController
    def index
      render json: current_user.categories, status: :ok
    end

    def create
      category = Category.new(category_params.merge(user: current_user))

      if category.save
        render json: category, status: :created
      else
        render json: { errors: category.errors }, status: :unprocessable_entity
      end
    end

    def update
      category = current_user.categories.where(id: params[:id]).first

      if category.present?
        if category.update(category_params)
          render json: category, status: :accepted and return
        end

        render json: { errors: category.errors }, status: :unprocessable_entity
      end

      render json: { errors: { category: [I18n.t('activerecord.errors.messages.not_found')] } }, status: :unprocessable_entity
    end

    def destroy
      category = current_user.categories.where(id: params[:id]).first

      if category.present?
        category.destroy
        head :ok and return
      end

      render json: { errors: { category: [I18n.t('activerecord.errors.messages.not_found')] } }, status: :unprocessable_entity
    end

    private

    def category_params
      params.require(:category).permit(:name, :kind, :icon, :planned)
    end
  end
end
