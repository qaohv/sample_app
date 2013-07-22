class NotesController < ApplicationController

   before_filter :authenticate_user!
   before_filter :detect_empty_note, only: [ :create, :update ]
   before_filter :detect_search_params, only: [:search]

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = "Note created!"
      redirect_to root_url
    else
      render 'static_pages/home' 
    end
  end

  def edit
    @note = Note.find(params[:id])
    @notes = current_user.notes
    @is_edit_form = true ;
    render 'static_pages/home'
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    redirect_to root_url
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_url
  end

  def send_off
    p "send_off ================================= "
    p params
    @note = Note.find(params[:id])
    NoteMailer.send_note(User.find(@note.user_id).email, @note).deliver
    flash[:success] = "note sended"
    redirect_to root_url
  end

  def search
    @note = Note.new
    @notes = 
      current_user.notes.find_all do |note|
        note.theme[params[:search]] || note.content[params[:search]]
      end
    render "static_pages/home"
  end

  private 
    def note_params
      params.require(:note).permit(:theme, :content)
    end

    def detect_empty_note
      #unless params[:note].blank?
        if params[:note][:theme].blank? || params[:note][:content].blank?
          flash[:notice] = "Theme or content is empty"
          redirect_to root_url
        end
      #end
    end

    def detect_search_params
      p 'detect_search_params'
      p params[:search]
      p'+++++++++++++++'
      (flash[:error] = "Bad search params"; redirect_to '/') if params[:search].blank?
    end

end
