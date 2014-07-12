class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    #@contents = Content.all
    #@contents ? @category.contents : Content.all
    @contents = parent.contents.joins(:publication).where(publications: { publication: true})
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @content.to_json(:include => [:background, :height_screen, :nifty_corner]) }
    end
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find_by_uuid(params[:uuid])
    end

    def parent
        return parent? ? Submenu.find_by_title(params[:title_submenu_id]) : Category.find_by_title(params[:title_id])
    end

    def parent?
      return !request.url.scan(/^.{1,}(submenu).{1,}$/).empty?
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:description)
    end
end
