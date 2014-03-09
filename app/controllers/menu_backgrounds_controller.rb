class MenuBackgroundsController < ApplicationController
  before_action :set_menu_background, only: [:show, :edit, :update, :destroy]

  # GET /menu_backgrounds
  # GET /menu_backgrounds.json
  def index
    @menu_backgrounds = MenuBackground.all
  end

  # GET /menu_backgrounds/1
  # GET /menu_backgrounds/1.json
  def show
  end

  # GET /menu_backgrounds/new
  def new
    @menu_background = MenuBackground.new
  end

  # GET /menu_backgrounds/1/edit
  def edit
  end

  # POST /menu_backgrounds
  # POST /menu_backgrounds.json
  def create
    @menu_background = MenuBackground.new(menu_background_params)

    respond_to do |format|
      if @menu_background.save
        format.html { redirect_to @menu_background, notice: 'Menu background was successfully created.' }
        format.json { render action: 'show', status: :created, location: @menu_background }
      else
        format.html { render action: 'new' }
        format.json { render json: @menu_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_backgrounds/1
  # PATCH/PUT /menu_backgrounds/1.json
  def update
    respond_to do |format|
      if @menu_background.update(menu_background_params)
        format.html { redirect_to @menu_background, notice: 'Menu background was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @menu_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_backgrounds/1
  # DELETE /menu_backgrounds/1.json
  def destroy
    @menu_background.destroy
    respond_to do |format|
      format.html { redirect_to menu_backgrounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_background
      @menu_background = MenuBackground.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_background_params
      params[:menu_background]
    end
end
