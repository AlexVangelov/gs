module GsController
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_account!
  end
  
  private
    def sellable
      @sellable ||= current_account.businesses.find_by_uuid(params[:uuid])
      Thread.current[:sellable] = @sellable
    end
end
