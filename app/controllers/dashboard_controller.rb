class DashboardController < ApplicationController
  def index
    @account = Account.find_by_subdomain!(request.subdomain)
    #@account = Account.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end
end
