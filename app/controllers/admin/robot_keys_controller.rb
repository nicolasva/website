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

      if @robot_key.save
        redirect_to admin_robot_keys_path, notice: "Robot Key was successfully created"
      else
        render action: 'new'
      end
    end

    def update
      if @robot_key.update(robot_key_params)
        redirect_to admin_robot_keys_path, notice: "Robot Key was successfully updated"
      else
        render action: 'edit'
      end
    end

    def destroy
      notice =  @robot_key.destroy ? "Robot Key was successfully destroyed" : "Robot key was not successfully destroyed"
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
