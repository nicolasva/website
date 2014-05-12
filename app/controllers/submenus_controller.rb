class SubmenusController < ApplicationController
  before_action :set_submenu, only: [:show]

  def show
    respond_to do |format|
      format.json { render json: @submenu }
    end
  end

  private
    def set_submenu
      @submenu = Submenu.find_by_title(params[:id])
    end

    def submenu_params
      params[:submenu]
    end
end
