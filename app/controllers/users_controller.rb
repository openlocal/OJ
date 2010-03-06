class UsersController < Clearance::UsersController
  def show
    redirect_to root_path if params[:id].to_i != current_user.id
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Updated user profile.'
      redirect_to @user
    else
      flash[:notice] = 'Error updating user profile.'
      render 'edit'
    end
  end
  
    
end
