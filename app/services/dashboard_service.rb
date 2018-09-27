class DashboardService
  class << self
    def entries(month, year, user)
      date  = DateTime.parse("01/#{month}/#{year}")
      range = date.beginning_of_month..date.end_of_month

      user.entries.includes(:category).where(added_at: range).order(added_at: :desc)
    end
  end
end
