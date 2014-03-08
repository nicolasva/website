class FooterBackgroundsController < ApplicationController
  before_action :set_footer_background, only: [:show, :edit, :update, :destroy]

  # GET /footer_backgrounds
  # GET /footer_backgrounds.json
  def index
    @footer_backgrounds = FooterBackground.all
  end

  # GET /footer_backgrounds/1
  # GET /footer_backgrounds/1.json
  def show
  end

  # GET /footer_backgrounds/new
  def new
    @footer_background = FooterBackground.new
  end

  # GET /footer_backgrounds/1/edit
  def edit
  end

  # POST /footer_backgrounds
  # POST /footer_backgrounds.json
  def create
    @footer_background = FooterBackground.new(footer_background_params)

    respond_to do |format|
      if @footer_background.save
        format.html { redirect_to @footer_background, notice: 'Footer background was successfully created.' }
        format.json { render action: 'show', status: :created, location: @footer_background }
      else
        format.html { render action: 'new' }
        format.json { render json: @footer_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footer_backgrounds/1
  # PATCH/PUT /footer_backgrounds/1.json
  def update
    respond_to do |format|
      if @footer_background.update(footer_background_params)
        format.html { redirect_to @footer_background, notice: 'Footer background was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @footer_background.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footer_backgrounds/1
  # DELETE /footer_backgrounds/1.json
  def destroy
    @footer_background.destroy
    respond_to do |format|
      format.html { redirect_to footer_backgrounds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_footer_background
      @footer_background = FooterBackground.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def footer_background_params
      params[:footer_background]
    end
end
