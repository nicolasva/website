class AlignsController < ApplicationController
  before_action :set_align, only: [:show, :edit, :update, :destroy]

  # GET /aligns
  # GET /aligns.json
  def index
    @aligns = Align.all
  end

  # GET /aligns/1
  # GET /aligns/1.json
  def show
  end

  # GET /aligns/new
  def new
    @align = Align.new
  end

  # GET /aligns/1/edit
  def edit
  end

  # POST /aligns
  # POST /aligns.json
  def create
    @align = Align.new(align_params)

    respond_to do |format|
      if @align.save
        format.html { redirect_to @align, notice: 'Align was successfully created.' }
        format.json { render action: 'show', status: :created, location: @align }
      else
        format.html { render action: 'new' }
        format.json { render json: @align.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aligns/1
  # PATCH/PUT /aligns/1.json
  def update
    respond_to do |format|
      if @align.update(align_params)
        format.html { redirect_to @align, notice: 'Align was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @align.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aligns/1
  # DELETE /aligns/1.json
  def destroy
    @align.destroy
    respond_to do |format|
      format.html { redirect_to aligns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_align
      @align = Align.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def align_params
      params[:align]
    end
end
