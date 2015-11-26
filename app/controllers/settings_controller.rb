class SettingsController < ApplicationController
  
  def show
    respond_to do |format|
      format.html{ render partial: true }
    end
  end
end
