class PersonalizeBackgroundsController < ApplicationController
  def index
    @personalize_background = PersonalizeBackground.find_by_activation(true)
    respond_to do |format|
      format.json { render json: @personalize_background.to_json(:include => [:background, :height_screen])}
    end
  end
end
