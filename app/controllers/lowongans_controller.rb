class LowongansController < ApplicationController
  before_action :admin_user, except: [:index, :show]
  
  def index
    @lowongans = Lowongan.paginate(page: params[:page],:per_page => 10)
  end
  
  def show
    @lowongan = Lowongan.find(params[:id])
    @lamaran = @lowongan.lamarans.build
    @pelamars = @lowongan.lamarans.paginate(page: params[:page],:per_page => 5)
  end
  
  def new
    @lowongan = Lowongan.new
  end
  
  def create
    @lowongan = Lowongan.new(lowongan_params)
      if @lowongan.save
        redirect_to @lowongan, notice: 'Lowongan berhasil dibuat.'
      else
        render 'lowongans/new' 
      end
  end
  
  def edit
    @lowongan = Lowongan.find(params[:id])
  end
  
  def update
    @lowongan = Lowongan.find(params[:id])
    if @lowongan.update(lowongan_params)
      flash[:success] = "Lowongan berhasil disimpan!"
      render 'lowongans/show'
    else
      render 'lowongans/edit'
    end
  end
  
  def destroy
    @lowongan = Lowongan.find(params[:id])
    @lowongan.destroy
    redirect_to lowongans_url, notice: 'Lowongan berhasil dihapus.'
  end
  
  private
    def lowongan_params
      params.require(:lowongan).permit(:jabatan_id, :pendidikan_id, :limit_umur,
      :ket_umum, :deskripsi,:posted,:max_tgl)
    end
    
    def admin_user
      redirect_to(lowongans_url) unless current_user.try(:admin?)
    end
end
