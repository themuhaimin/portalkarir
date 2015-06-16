class UsersController < ApplicationController
before_action :admin_user,  only: [:index, :set_admin, :destroy ]


  def index
    @users = User.paginate(page: params[:page],:per_page => 10)
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User dihapus"
    redirect_to users_url
  end
  
  def set_admin
      @user = User.find(params[:id])
      @user.update_attribute(:admin, true)
      flash[:success] = "User dijadikan admin"
      redirect_to users_url
  end

    
  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    

end