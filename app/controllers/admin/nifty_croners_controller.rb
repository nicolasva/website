module Admin
  class NiftyCornersController < AdminController 
    before_action :set_nifty_corner, only: [:show, :edit, :update, :destroy]
  
    def index

    end

    private
    def set_nifty_corner
      @nifty_corner = NiftyCorner.find(params[:id])
    end
  end
end
