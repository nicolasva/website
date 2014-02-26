class HomepageSubmenusController < ApplicationController
  before_action :set_homepage_submenu, only: [:show, :edit, :update, :destroy]

  # GET /homepage_submenus
  # GET /homepage_submenus.json
  def index
    @homepage_submenus = HomepageSubmenu.all
  end

  # GET /homepage_submenus/1
  # GET /homepage_submenus/1.json
  def show
  end

  # GET /homepage_submenus/new
  def new
    @homepage_submenu = HomepageSubmenu.new
  end

  # GET /homepage_submenus/1/edit
  def edit
  end

  # POST /homepage_submenus
  # POST /homepage_submenus.json
  def create
    @homepage_submenu = HomepageSubmenu.new(homepage_submenu_params)

    respond_to do |format|
      if @homepage_submenu.save
        format.html { redirect_to @homepage_submenu, notice: 'Homepage submenu was successfully created.' }
        format.json { render action: 'show', status: :created, location: @homepage_submenu }
      else
        format.html { render action: 'new' }
        format.json { render json: @homepage_submenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homepage_submenus/1
  # PATCH/PUT /homepage_submenus/1.json
  def update
    respond_to do |format|
      if @homepage_submenu.update(homepage_submenu_params)
        format.html { redirect_to @homepage_submenu, notice: 'Homepage submenu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @homepage_submenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homepage_submenus/1
  # DELETE /homepage_submenus/1.json
  def destroy
    @homepage_submenu.destroy
    respond_to do |format|
      format.html { redirect_to homepage_submenus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homepage_submenu
      @homepage_submenu = HomepageSubmenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def homepage_submenu_params
      params[:homepage_submenu]
    end
end
