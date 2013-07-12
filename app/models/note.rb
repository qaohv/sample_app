class Note < ActiveRecord::Base
  
  belongs_to :user

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :content, presence: true, length: { minimum: 1 }
  validates :theme, presence: true, length: { minimum: 1 }

  default_scope order: 'notes.created_at DESC'
end
