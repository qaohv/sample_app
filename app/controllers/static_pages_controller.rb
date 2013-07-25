class StaticPagesController < ApplicationController
  
  def home
    @note = current_user ? Note.new : nil
    @notes = current_user ? current_user.notes.paginate(page: params[:page], per_page: 5) : nil
  end

  ["help","contact","about"].each do |action|
    define_method action do; end
  end

end
