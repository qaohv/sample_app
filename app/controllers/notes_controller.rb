class NotesController < ApplicationController

   before_filter :authenticate_user!
   before_filter :detect_empty_note

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = "Note created!"
      redirect_to root_url
    else
      render "static_pages/home" 
    end
  end

  def edit
    @note = Note.find(params[:id])
    @note.destroy
    @notes = current_user.notes
    render 'static_pages/home'
  end


  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_url
  end

  private 

    def note_params
      params.require(:note).permit(:theme, :content)
    end

    def detect_empty_note
      unless params[:note].blank?
        if params[:note][:theme].blank? || params[:note][:content].blank?
          flash[:notice] = "Theme or content is empty"
          redirect_to root_url
        end
      end
    end

end
