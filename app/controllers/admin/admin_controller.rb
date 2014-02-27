module Admin
  class AdminController < ApplicationController
    layout "admin"

    private
      def redirection_url(params,notice)
        #content_list_category_title_dsqdqsdqsd
        params_array = params.split("_") 
        case params_array.first
          when "content"
            redirect_to admin_title_contents_path(params_array.last), notice: notice
          when "annoncment"
            redirect_to admin_title_annoncments_path(params_array.last), notice: notice
          when "allcategory"
            redirect_to admin_title_index_path, notice: notice
        end
      end
  end
end
