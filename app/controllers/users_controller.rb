class UsersController < Clearance::UsersController
  def show
    redirect_to root_path if params[:id].to_i != current_user.id
    
    @user = current_user
  end
end
