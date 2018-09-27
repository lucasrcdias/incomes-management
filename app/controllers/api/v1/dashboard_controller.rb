module API::V1
  class DashboardController < API::V1::BaseController
    def index
      entries = DashboardService
        .entries(dashboard_params[:month], dashboard_params[:year], current_user)

      render json: entries, status: :ok
    end

    private

    def dashboard_params
      params.permit(:month, :year)
    end
  end
end
