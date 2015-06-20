# Preview all emails at http://localhost:3000/rails/mailers/panggilan_mailer
class PanggilanMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/panggilan_mailer/panggilan_mail
  def panggilan_mail
    @lamaran = Lamaran.first
    @panggilan = Panggilan.new(pengumumann_id: 3, 
        lamaran_id: @lamaran.id)
    PanggilanMailer.panggilan_mail(@panggilan)
  end

end
