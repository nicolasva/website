class BackgroundsController < ApplicationController
  before_action :set_background, only: [:show, :edit, :update, :destroy]

  def index
    @background = parent.background

    respond_to do |format|
      format.json { render json: @background }
    end
  end

  private
    def set_background
      @background = Background.find(params[:id])
    end

    def parent
      case parent?
        when "contents"
          return Content.find_by_uuid(params[:uuid])
        when "annoncments"
          return Annoncment.find_by_title(params[:title_annoncment_id])
      end
    end

    def parent?
      return request.url.split("/")[3]
    end
end
