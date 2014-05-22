class AnnoncmentsController < ApplicationController
  before_action :set_annoncment, only: [:show, :edit, :update, :destroy]

  # GET /annoncments
  # GET /annoncments.json
  def index
    @annoncments = parent.annoncments
  end

  # GET /annoncments/1
  # GET /annoncments/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @annoncment.to_json(:include => :background) }
    end
  end

  # GET /annoncments/new
  def new
    @annoncment = Annoncment.new
  end

  # GET /annoncments/1/edit
  def edit
  end

  # POST /annoncments
  # POST /annoncments.json
  def create
    @annoncment = Annoncment.new(annoncment_params)

    respond_to do |format|
      if @annoncment.save
        format.html { redirect_to @annoncment, notice: 'Annoncment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @annoncment }
      else
        format.html { render action: 'new' }
        format.json { render json: @annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoncments/1
  # PATCH/PUT /annoncments/1.json
  def update
    respond_to do |format|
      if @annoncment.update(annoncment_params)
        format.html { redirect_to @annoncment, notice: 'Annoncment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @annoncment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoncments/1
  # DELETE /annoncments/1.json
  def destroy
    @annoncment.destroy
    respond_to do |format|
      format.html { redirect_to annoncments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annoncment
      @annoncment = parent.annoncments.find_by_title(params[:id])
    end

    def parent
        return parent? ? Submenu.find_by_title(params[:title_submenu_id]) : Category.find_by_title(params[:title_id])
    end

    def parent?
      return !request.url.scan(/^.{1,}(submenu).{1,}$/).empty?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annoncment_params
      params[:annoncment]
    end
end
