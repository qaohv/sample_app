class NoteMailer < ActionMailer::Base
  default from: "rtfm24@gmail.com"

  def send_note(email, note)
  	@note = note
   	mail(to: email, subject: "Share note") 	
  end

end
