class BackgroundAnnoncmentsController < ApplicationController
  before_action :set_background_annoncment, only: [:show, :edit, :update, :destroy]

  # GET /background_annoncments
  # GET /background_annoncments.json
  def index
    @background_annoncments = BackgroundAnnoncment.all
  end

  # GET /background_annoncments/1
  # GET /background_annoncments/1.json
  def show
  end

  # GET /background_annoncments/new
  def new
    @background_annoncment = BackgroundAnnoncment.new
  end

  # GET /background_annoncments/1/edit
  def edit
  end

  # POST /background_annoncments
  # POST /background_annoncments.json
  def create
    @background_annoncment = BackgroundAnnoncment.new(background_annoncment_params)

    respond_to do |format|
      if @background_annoncment.save
        format.html { redirect_to @background_annoncment, notice: 'Background annoncment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @background_annoncment }
      else
        format.html { render action: 'new' }
        format.json { render json: @background_annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /background_annoncments/1
  # PATCH/PUT /background_annoncments/1.json
  def update
    respond_to do |format|
      if @background_annoncment.update(background_annoncment_params)
        format.html { redirect_to @background_annoncment, notice: 'Background annoncment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @background_annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /background_annoncments/1
  # DELETE /background_annoncments/1.json
  def destroy
    @background_annoncment.destroy
    respond_to do |format|
      format.html { redirect_to background_annoncments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background_annoncment
      @background_annoncment = BackgroundAnnoncment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_annoncment_params
      params[:background_annoncment]
    end
end
