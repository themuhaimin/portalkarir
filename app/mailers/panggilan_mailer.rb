class PanggilanMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.panggilan_mailer.panggilan_mail.subject
  #
  def panggilan_mail(panggilan)
    @panggilan = panggilan
    @user = @panggilan.lamaran.user
    @jabatan = @panggilan.lamaran.lowongan.jabatan
    @pengumumann = @panggilan.pengumumann
    mail to: @user.email, subject: "Panggilan Tes CARfix Indonesia"
  end
end
