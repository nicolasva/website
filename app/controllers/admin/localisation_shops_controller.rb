module Admin
  class LocalisationShopsController < AdminController
    before_action :set_localisation_shop, only: [:show, :edit, :update, :destroy]

    def index
      @localisation_shops = LocalisationShop.all
    end

    def new
      @localisation_shop = LocalisationShop.new
    end

    def create
      @localisation_shop = LocalisationShop.new(localisation_shop_params)
      @notice = "La création de cette localisation des boutiques s'est bien déroulé"
      respond_to do |format|
        if @localisation_shop.save
          format.html { redirect_to admin_localisation_shops_path, notice: @notice}
          format.js
        else
          @notice = "La création de cette localisation des boutiques ne s'est pas déroulé corecctement"
          format.html { render action: "new" }
          format.js { redirect_to(action: :create_error, format: :js) }
        end
      end
    end

    def show
    end

    def edit
    end

    def update
      @notice = "La mise à jour de cette localisation de cette boutique s'est bien déroulé elle est désormais disponible"
      respond_to do |format|
        if @localisation_shop.update(localisation_shop_params)
          format.html { redirect_to admin_localisation_shops_path, notice: @notice}
          format.js
        else
          @notice = "La mise à jour de cette localisation de cette boutique ne s'est pas déroulé correctement elle n'est pas disponible"
          format.html { render action: 'edit'}
          format.js { redirect_to(action: :create_error, format: :js) }
        end
      end
    end

    def destroy
      notice = @localisation_shop.destroy ? "Cette localisation pour cette boutique a bien été supprimé" : "Cette localisation pour cette boutique n'a pas été supprimé correctement"
      redirect_to admin_localisation_shops_path, notice: notice
    end

    private
      def set_localisation_shop
        @localisation_shop = LocalisationShop.find(params[:id])
      end

      def localisation_shop_params
        params.require(:localisation_shop).permit(:id,
                                                  :address,
                                                  :postal_code,
                                                  :city
                                                 )
      end
  end
end
