# == Schema Information
#
# Table name: photos
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  description          :text(65535)
#  content_file_name    :string(255)
#  content_content_type :string(255)
#  content_file_size    :integer
#  content_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture              :string(255)
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
