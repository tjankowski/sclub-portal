# -*- encoding : utf-8 -*-
class UserMailer < ActionMailer::Base

  def signup_notification(user)
    setup_email(user)
    @subject += "Proszę aktywować swoje nowe konto"
    @body[:url] = "http://www.ksmotobi.pl/activate/#{user.activation_code}"
  end

  def activation(user)
    setup_email(user)
    @subject += "Twoje konto zostało aktywowane"
    @body[:url] = "http://www.ksmotobi.pl"
  end

  def forgot_password(user)
    setup_email(user)
    @subject += "Poprosiłeś o zmianę hasła"
    @body[:url] = "http://www.ksmotobi.pl/reset_password/#{user.password_reset_code}"
  end

  def reset_password(user)
    setup_email(user)
    @subject += "Twoje hasło zostało zmienione"
  end

  protected
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = "motobi.bystrzyca.katy.wroclawskie@strona.pl"
    @subject = ""
    @sent_on = Time.now
    @body[:user] = user
  end

end
