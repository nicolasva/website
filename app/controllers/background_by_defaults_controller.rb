class BackgroundByDefaultsController < ApplicationController
  before_action :set_background_by_default, only: [:show, :edit, :update, :destroy]

  # GET /background_by_defaults
  # GET /background_by_defaults.json
  def index
    @background_by_default = BackgroundByDefault.find_by_activation(true)
    respond_to do |format|
      format.json { render json: @background_by_default.to_json(:include => :background) }
    end
  end

  # GET /background_by_defaults/1
  # GET /background_by_defaults/1.json
  def show
  end

  # GET /background_by_defaults/new
  def new
    @background_by_default = BackgroundByDefault.new
  end

  # GET /background_by_defaults/1/edit
  def edit
  end

  # POST /background_by_defaults
  # POST /background_by_defaults.json
  def create
    @background_by_default = BackgroundByDefault.new(background_by_default_params)

    respond_to do |format|
      if @background_by_default.save
        format.html { redirect_to @background_by_default, notice: 'Background by default was successfully created.' }
        format.json { render action: 'show', status: :created, location: @background_by_default }
      else
        format.html { render action: 'new' }
        format.json { render json: @background_by_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /background_by_defaults/1
  # PATCH/PUT /background_by_defaults/1.json
  def update
    respond_to do |format|
      if @background_by_default.update(background_by_default_params)
        format.html { redirect_to @background_by_default, notice: 'Background by default was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @background_by_default.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /background_by_defaults/1
  # DELETE /background_by_defaults/1.json
  def destroy
    @background_by_default.destroy
    respond_to do |format|
      format.html { redirect_to background_by_defaults_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background_by_default
      @background_by_default = BackgroundByDefault.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_by_default_params
      params[:background_by_default]
    end
end
