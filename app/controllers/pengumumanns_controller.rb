class PengumumannsController < ApplicationController
  before_action :admin_user, except: [:index, :show]
  
  def index
    @pengumumanns = Pengumumann.paginate(page: params[:page],:per_page => 10)
  end
  
  def show
    @pengumumann = Pengumumann.find(params[:id])
    @panggilan = Panggilan.new
    @terpanggil = @pengumumann.panggilans
    @lamarans = Lamaran.where.not(dipanggil: true).order(created_at: :desc)
  end
  
  def new
    @pengumumann = Pengumumann.new
  end
  
  def create
    @pengumumann = Pengumumann.new(pengumumann_params)
      if @pengumumann.save
        redirect_to @pengumumann, notice: 'Pengumuman berhasil dibuat.'
      else
        render 'pengumumanns/new' 
      end
  end
  
  def edit
    @pengumumann = Pengumumann.find(params[:id])
  end
  
  def update
    @pengumumann = Pengumumann.find(params[:id])
    @panggilan = Panggilan.new
    @terpanggil = @pengumumann.panggilans
    @lamarans = Lamaran.where.not(dipanggil: true).order(created_at: :desc)
    if @pengumumann.update(pengumumann_params)
      flash[:success] = "Pengumumann berhasil disimpan!"
      render 'pengumumanns/show'
    else
      render 'pengumumanns/edit'
    end
  end
  
  def destroy
    @pengumumann = Pengumumann.find(params[:id])
    @pengumumann.destroy
    redirect_to pengumumanns_url, notice: 'Pengumumann berhasil dihapus.'
  end
  
  private
    def pengumumann_params
      params.require(:pengumumann).permit(:judul, :deskripsi, :tanggal,
      :tempat, :waktu, :kelengkapan)
    end
    
    def admin_user
      redirect_to(pengumumanns_url) unless current_user.try(:admin?)
    end
end
