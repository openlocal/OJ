class UsersController < Clearance::UsersController
  def show
    @profile = User.find params[:id]
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
