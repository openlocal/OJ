class UsersController < Clearance::UsersController
  def show
    @profile = User.find params[:id]
    
    @feedbacks = @profile.help_offers.collect { |offer| offer.feedback }.compact
    length     = @feedbacks.empty? ? 1 : @feedbacks.length
    @rating    = @feedbacks.collect { |fb| fb.rating }.sum / length.to_f
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
