class DashboardController < ApplicationController
  def index
  	@account = Account.new
  	1.times { @account.users.build }
  end
end
