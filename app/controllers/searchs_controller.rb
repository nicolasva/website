class SearchsController < ApplicationController
  def create
    @contents = Content.search(params[:search][:query]).records
  end
end
