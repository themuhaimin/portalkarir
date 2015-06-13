class ProfilsController < ApplicationController
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_or_correct_user, only: :show
  
  def new
    @user = User.find(params[:user_id])
    @profil = @user.build_profil
  end
  
  def create
    @user = User.find(params[:user_id])
    @profil = @user.build_profil(profil_params)
    if @profil.save
      flash[:success] = "Profil berhasil dibuat!"
      render 'profils/show'
    else
      render 'profils/new'
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @profil = @user.profil
  end
  
  def edit
    @user = User.find(params[:user_id])
    @profil = @user.profil
  end
  
  def update
    @user = User.find(params[:user_id])
    @profil = @user.profil
    @profil.update_attributes(profil_params)
    if @profil.save
      flash[:success] = "Profil berhasil disimpan!"
      render 'profils/show'
    else
      render 'profils/edit'
    end
  end
  
  def destroy
  end
  
  private

    def profil_params
      params.require(:profil).permit(:nama_lengkap, :no_identitas, :jenis_kelamin, 
            :alamat, :tempat_lahir, :tgl_lahir, :no_hp, :pendidikan_id, :nama_pend, 
            :jurusan, :nilai)
    end
    
    def correct_user
      authenticate_user!
      @user = User.find(params[:user_id])
      redirect_to user_profil_path(current_user) if current_user.id!=@user.id
    end
    
    def admin_or_correct_user
      authenticate_user!
      @user = User.find(params[:user_id])
      redirect_to(root_url) unless (current_user.id!=@user.id || current_user.admin?)
    end
end
