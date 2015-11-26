class AccountsController < ApplicationController
  def show
    respond_to do |format|
      format.json{  @account = current_account }
      format.html{ render partial: true }
    end
  end
end
