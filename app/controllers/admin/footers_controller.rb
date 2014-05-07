module Admin
  class FootersController < AdminController 
    before_action :set_footer, only: [:edit, :update]
    def edit
    end

    def update
      @notice = "Footer was successfully updated."
      respond_to do |format|
        if @footer.update(footer_params)
          format.html { redirect_to @footer, notice: @notice}
          format.js
        else
          @notice = "Footer was not successfully updated."
          format.html { render action: "edit" }
          format.js { redirect_to(:action => :update_error_footer, :format => :js) }
        end
      end
    end

    private
      def set_footer
        @footer = Footer.find(params[:id])
      end

      def footer_params
        params.require(:footer).permit(:id,
                                       :legal_mention
                                      )
      end
  end
end
