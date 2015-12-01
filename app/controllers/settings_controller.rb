class SettingsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html{ render partial: true }
    end
  end
  
  def show
    respond_to do |format|
      format.html{ render partial: params[:id] }
    end
  end
end
