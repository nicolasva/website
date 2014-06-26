module Admin
  class NiftyCornersController < AdminController 
    before_action :set_nifty_corner, only: [:show, :edit? :update, :destroy]
  
    def index

    end
  end
end
