class SearchsController < ApplicationController
  def create
    @contents = Content.search(params[:search][:query]).records
  end

  def link_load_form_search
    
  end
end
