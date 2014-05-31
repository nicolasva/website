module Admin
  class RobotKeysController < AdminController
    before_action :set_robot_key, only: [:show, :edit, :update, :destroy]

    def index
      @robot_keys = Robot::Key.all
    end

    def new
      @robot_key = Robot::Key.new
    end

    def edit
    end

    def show
    end

    def create
      @robot_key = Robot::Key.new(robot_key_params)

      @notice = t(".robot_key_success_create") 
      respond_to do |format|
        if @robot_key.save
          format.html { redirect_to admin_robot_keys_path, notice: @notice }
          format.js
        else
          @notice = t(".robot_key_success_not_create")
          format.html { render action: 'new' }
          format.js { redirect_to(:action => :create_error_robot_key, :format => :js) } 
        end
      end
    end

    def update
      @notice = t(".robot_key_success_updated") 
      respond_to do |format|
        if @robot_key.update(robot_key_params)
          format.html { redirect_to admin_robot_keys_path, notice: @notice }
          format.js
        else
          @notice = t(".robot_key_success_not_updated")
          format.html { render action: 'edit' }
          format.js { redirect_to(:action => :edit_error_robot_key, :format => :js)}
        end
      end
    end

    def destroy
      notice =  @robot_key.destroy ? t(".robot_key_success_destroy") : t(".robot_key_not_success_destroy")
      redirect_to admin_robot_keys_path, notice: notice
    end

    private
      def set_robot_key
        @robot_key = Robot::Key.find_by_uuid(params[:id])
      end

      def robot_key_params
        params.require(:robot_key).permit(:id,
                                          :uuid,
                                          :name,
                                          :lang,
                                          :content
                                         )
      end
  end
end
