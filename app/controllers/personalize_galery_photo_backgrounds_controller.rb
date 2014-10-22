class PersonalizeGaleryPhotoBackgroundsController < ApplicationController
  before_action :set_personalize_galery_photo_background, only: [:show, :edit, :update, :destroy]

  def index
    @personalize_galery_photo_backgrounds = PersonalizeGaleryPhotoBackground.find_by_activation(true)
    respond_to do |format|
      format.json { render json: @personalize_galery_photo_backgrounds.to_json(:include => :background) }
    end
  end
end
