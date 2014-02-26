class ContentsOrAnnoncmentsController < ApplicationController
  before_action :set_contents_or_annoncment, only: [:show, :edit, :update, :destroy]

  # GET /contents_or_annoncments
  # GET /contents_or_annoncments.json
  def index
    @contents_or_annoncments = ContentsOrAnnoncment.all
  end

  # GET /contents_or_annoncments/1
  # GET /contents_or_annoncments/1.json
  def show
  end

  # GET /contents_or_annoncments/new
  def new
    @contents_or_annoncment = ContentsOrAnnoncment.new
  end

  # GET /contents_or_annoncments/1/edit
  def edit
  end

  # POST /contents_or_annoncments
  # POST /contents_or_annoncments.json
  def create
    @contents_or_annoncment = ContentsOrAnnoncment.new(contents_or_annoncment_params)

    respond_to do |format|
      if @contents_or_annoncment.save
        format.html { redirect_to @contents_or_annoncment, notice: 'Contents or annoncment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contents_or_annoncment }
      else
        format.html { render action: 'new' }
        format.json { render json: @contents_or_annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents_or_annoncments/1
  # PATCH/PUT /contents_or_annoncments/1.json
  def update
    respond_to do |format|
      if @contents_or_annoncment.update(contents_or_annoncment_params)
        format.html { redirect_to @contents_or_annoncment, notice: 'Contents or annoncment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contents_or_annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents_or_annoncments/1
  # DELETE /contents_or_annoncments/1.json
  def destroy
    @contents_or_annoncment.destroy
    respond_to do |format|
      format.html { redirect_to contents_or_annoncments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contents_or_annoncment
      @contents_or_annoncment = ContentsOrAnnoncment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contents_or_annoncment_params
      params[:contents_or_annoncment]
    end
end
