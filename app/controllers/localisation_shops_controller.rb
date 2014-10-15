class LocalisationShopsController < ApplicationController
  before_action :get_all_localisation_shops, only: [:index, :localisation_shops_list]
  def index
  end

  def localisation_shops_list
    respond_to do |format|
      format.json { render json: @localisation_shops }
    end
  end

  private
    def get_all_localisation_shops
      @localisation_shops = LocalisationShop.all
    end
end
