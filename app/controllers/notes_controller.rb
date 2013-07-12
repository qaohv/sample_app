class NotesController < ApplicationController

   before_filter :authenticate_user!

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = "Note created!"
      redirect_to root_url
    else
      render "static_pages/home" 
    end
  end

  def destroy
  end

  private 
    def note_params
      params.require(:note).permit(:theme, :content)
    end

end
