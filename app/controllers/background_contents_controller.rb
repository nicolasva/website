class BackgroundContentsController < ApplicationController
  before_action :set_background_content, only: [:show, :edit, :update, :destroy]

  # GET /background_contents
  # GET /background_contents.json
  def index
    @background_contents = BackgroundContent.all
  end

  # GET /background_contents/1
  # GET /background_contents/1.json
  def show
  end

  # GET /background_contents/new
  def new
    @background_content = BackgroundContent.new
  end

  # GET /background_contents/1/edit
  def edit
  end

  # POST /background_contents
  # POST /background_contents.json
  def create
    @background_content = BackgroundContent.new(background_content_params)

    respond_to do |format|
      if @background_content.save
        format.html { redirect_to @background_content, notice: 'Background content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @background_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @background_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /background_contents/1
  # PATCH/PUT /background_contents/1.json
  def update
    respond_to do |format|
      if @background_content.update(background_content_params)
        format.html { redirect_to @background_content, notice: 'Background content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @background_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /background_contents/1
  # DELETE /background_contents/1.json
  def destroy
    @background_content.destroy
    respond_to do |format|
      format.html { redirect_to background_contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_background_content
      @background_content = BackgroundContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def background_content_params
      params[:background_content]
    end
end
