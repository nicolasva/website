class SubMenuBackgroundsController < ApplicationController
  before_action :set_sub_menu_background, only: [:show, :edit, :update, :destroy]

  # GET /sub_menu_backgrounds
  # GET /sub_menu_backgrounds.json
  def index
    @sub_menu_backgrounds = SubMenuBackground.all
  end

  # GET /sub_menu_backgrounds/1
  # GET /sub_menu_backgrounds/1.json
  def show
  end

  # GET /sub_menu_backgrounds/new
  def new
    @sub_menu_background = SubMenuBackground.new
  end

  # GET /sub_menu_backgrounds/1/edit
  def edit
  end

  # POST /sub_menu_backgrounds
  # POST /sub_menu_backgrounds.json
  def create
    @sub_menu_background = SubMenuBackground.new(sub_menu_background_params)

    respond_to do |format|
      if @sub_menu_background.save
        format.html { redirect_to @sub_menu_background, notice: 'Sub menu background was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sub_menu_background }
      else
        format.html { render action: 'new' }
        format.json { render json: @sub_menu_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_menu_backgrounds/1
  # PATCH/PUT /sub_menu_backgrounds/1.json
  def update
    respond_to do |format|
      if @sub_menu_background.update(sub_menu_background_params)
        format.html { redirect_to @sub_menu_background, notice: 'Sub menu background was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sub_menu_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_menu_backgrounds/1
  # DELETE /sub_menu_backgrounds/1.json
  def destroy
    @sub_menu_background.destroy
    respond_to do |format|
      format.html { redirect_to sub_menu_backgrounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_menu_background
      @sub_menu_background = SubMenuBackground.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_menu_background_params
      params[:sub_menu_background]
    end
end
