# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  theme      :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Note do
  pending "add some examples to (or delete) #{__FILE__}"
end
