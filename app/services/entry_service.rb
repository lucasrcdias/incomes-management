class EntryService
  class << self
    def new(params)
      added_at = params[:added_at] || DateTime.now

      Entry.new(params.merge({ added_at: added_at }))
    end
  end
end
