class ConfirmationsController < Clearance::ConfirmationsController
  private
  
  def url_after_create
    user_path(@user)
  end
end
