class StaticPagesController < ApplicationController
  def home
    @note = current_user.notes.build
   # @notes = current_user.notes#? ? current_user.notes : Note.all
  end

  ["help","contact","about"].each do |action|
    define_method action do; end
  end

end
