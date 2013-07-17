class NoteMailer < ActionMailer::Base
  default from: "rtfm24@gmail.com"

  def send_note(note)
  	@note = note
  	mail(to: "ryabokon.denis@ya.ru", subject: "Share note") 	
  end

end
