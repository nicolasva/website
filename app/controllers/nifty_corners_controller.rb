class NiftyCornersController < ApplicationController
  before_action :set_nifty_corner, only: [:show, :edit, :update, :destroy]

  # GET /nifty_corners
  # GET /nifty_corners.json
  def index
    @nifty_corners = NiftyCorner.all
  end

  # GET /nifty_corners/1
  # GET /nifty_corners/1.json
  def show
  end

  # GET /nifty_corners/new
  def new
    @nifty_corner = NiftyCorner.new
  end

  # GET /nifty_corners/1/edit
  def edit
  end

  # POST /nifty_corners
  # POST /nifty_corners.json
  def create
    @nifty_corner = NiftyCorner.new(nifty_corner_params)

    respond_to do |format|
      if @nifty_corner.save
        format.html { redirect_to @nifty_corner, notice: 'Nifty corner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @nifty_corner }
      else
        format.html { render action: 'new' }
        format.json { render json: @nifty_corner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nifty_corners/1
  # PATCH/PUT /nifty_corners/1.json
  def update
    respond_to do |format|
      if @nifty_corner.update(nifty_corner_params)
        format.html { redirect_to @nifty_corner, notice: 'Nifty corner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nifty_corner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nifty_corners/1
  # DELETE /nifty_corners/1.json
  def destroy
    @nifty_corner.destroy
    respond_to do |format|
      format.html { redirect_to nifty_corners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nifty_corner
      @nifty_corner = NiftyCorner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nifty_corner_params
      params[:nifty_corner]
    end
end
