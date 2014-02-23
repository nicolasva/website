class HomeController < ApplicationController
  def index
    @contents = Category.find_by_homepage(true).contents
  end
end
