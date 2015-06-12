class ProfilsController < ApplicationController
   before_action :current_user, only: [:new, :create, :edit, :show, :update, :destroy]
   
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
    
    def cek_profil_ada
      redirect_to new_user_profil_path(current_user) unless current_user.profil
    end
end
