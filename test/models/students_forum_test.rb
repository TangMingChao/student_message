# == Schema Information
#
# Table name: students_forums
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class StudentsForumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
