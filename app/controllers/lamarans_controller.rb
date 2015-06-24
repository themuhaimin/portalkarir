class LamaransController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :admin_user, only: :index
  
  def index
    @lamarans = Lamaran.paginate(page: params[:page],:per_page => 10)
  end
  
  def create
    @user = User.find(params[:user_id])
    @lowongan = Lowongan.find(params[:lowongan_id])
    if @user.profil.nama_lengkap.nil?
      flash[:alert] = "Lengkapi data diri Anda."
      redirect_to @user.profil
    elsif @user.profil.tgl_lahir < @lowongan.limit_umur.years.ago.localtime
      flash[:alert] = "Usia Anda melebihi batas umur."
      redirect_to @lowongan
    elsif @user.profil.pendidikan_id != @lowongan.pendidikan_id
      flash[:alert] = "Pendidikan terakhir Anda tidak sesuai."
      redirect_to @lowongan
    else
      @lamaran = Lamaran.new(lamaran_params)
        if @lamaran.save
          flash[:success] = "Berhasil melamar lowongan."
          redirect_to @lowongan
        else
          flash[:alert] = "Terjadi kesalahan silakan coba melamar lagi." 
          redirect_to @lowongan
        end
    end
  end
  
  private
    def lamaran_params
      params.permit(:user_id,:lowongan_id,:dipanggil)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.try(:admin?)
    end
end
