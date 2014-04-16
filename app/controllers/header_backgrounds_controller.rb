class HeaderBackgroundsController < ApplicationController
  before_action :set_header_background, only: [:show, :edit, :update, :destroy]

  # GET /header_backgrounds
  # GET /header_backgrounds.json
  def index
    @header_background = HeaderBackground.find_by_activation(true)
    respond_to do |format|
      format.json { render json: @header_background.to_json(:include => :background) }
    end
  end

  # GET /header_backgrounds/1
  # GET /header_backgrounds/1.json
  def show
  end

  # GET /header_backgrounds/new
  def new
    @header_background = HeaderBackground.new
  end

  # GET /header_backgrounds/1/edit
  def edit
  end

  # POST /header_backgrounds
  # POST /header_backgrounds.json
  def create
    @header_background = HeaderBackground.new(header_background_params)

    respond_to do |format|
      if @header_background.save
        format.html { redirect_to @header_background, notice: 'Header background was successfully created.' }
        format.json { render action: 'show', status: :created, location: @header_background }
      else
        format.html { render action: 'new' }
        format.json { render json: @header_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /header_backgrounds/1
  # PATCH/PUT /header_backgrounds/1.json
  def update
    respond_to do |format|
      if @header_background.update(header_background_params)
        format.html { redirect_to @header_background, notice: 'Header background was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @header_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /header_backgrounds/1
  # DELETE /header_backgrounds/1.json
  def destroy
    @header_background.destroy
    respond_to do |format|
      format.html { redirect_to header_backgrounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header_background
      @header_background = HeaderBackground.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def header_background_params
      params[:header_background]
    end
end
