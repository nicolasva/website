module Admin
  class ContactUsController < AdminController
    before_action :set_contact_u, only: [:show, :edit, :update, :destroy]

    def index
      @contact_us = ContactU.all
    end

    def show
    end

    def destroy
      notice = @contact_u.destroy ? t(".contact_us_was_successfully_destroy") : t("contact_us_was_not_successfully_destroy")
      redirect_to admin_contact_us_path
    end

    private
    def set_contact_u
      @contact_u = ContactU.find_by_title(params[:id])
    end
  end
end
