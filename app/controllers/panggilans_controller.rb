class PanggilansController < ApplicationController
  before_action :admin_user
  
  def create
    @pengumumann = Pengumumann.find(params[:panggilan][:pengumumann_id])
    @lamaran = Lamaran.find(params[:panggilan][:lamaran_id])
    @panggilan = Panggilan.new(panggilan_params)
      if @panggilan.save
        @lamaran.update(dipanggil: true)
        PanggilanMailer.panggilan_mail(@panggilan).deliver_later
        flash[:success] = "Nama berhasil ditambahkan!"
        redirect_to @pengumumann
      else
        flash[:alert] = "Nama gagal ditambahkan!"
        redirect_to @pengumumann
      end
  end
  
  def destroy
    @panggilan = Panggilan.find(params[:id])
    @pengumumann = @panggilan.pengumumann
    @lamaran = @panggilan.lamaran
    @panggilan.destroy
    @lamaran.update(dipanggil: false)
    flash[:success] = "Nama berhasil dihapus!"
    redirect_to @pengumumann
  end
  
private  
  def admin_user
      redirect_to(pengumumanns_url) unless current_user.try(:admin?)
  end
  
  def panggilan_params
      params.require(:panggilan).permit(:pengumumann_id,:lamaran_id)
  end
end
