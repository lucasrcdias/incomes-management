module API::V1
  class EntriesController < API::V1::BaseController
    def index
      render json: current_user.entries, status: :ok
    end

    def incomes
      render json: current_user.incomes, status: :ok
    end

    def expenses
      render json: current_user.expenses, status: :ok
    end

    def create
      entry = Entry.new(entry_params.merge(user: current_user))

      if entry.save
        render json: entry, status: :created
      else
        render json: { errors: entry.errors }, status: :unprocessable_entity
      end
    end

    def update
      entry = current_user.entries.where(id: params[:id]).first

      if entry.present?
        if entry.update(entry_params)
          render json: entry, status: :accepted and return
        end

        render json: { errors: entry.errors }, status: :unprocessable_entity
      end

      render json: { errors: { entry: [I18n.t('activerecord.errors.messages.not_found')] } }, status: :unprocessable_entity
    end

    def destroy
      entry = current_user.entries.where(id: params[:id]).first

      if entry.present?
        entry.destroy
        head :ok and return
      end

      render json: { errors: { entry: [I18n.t('activerecord.errors.messages.not_found')] } }, status: :unprocessable_entity
    end

    private

    def entry_params
      params.require(:entry).permit(:value, :category_id)
    end
  end
end
