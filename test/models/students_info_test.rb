# == Schema Information
#
# Table name: students_infos
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  sex                 :integer
#  number              :integer
#  phone               :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  age                 :integer
#  email               :string(255)
#  birthday            :datetime
#  qq                  :string(255)
#  address             :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  picture             :string(255)
#

require 'test_helper'

class StudentsInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
