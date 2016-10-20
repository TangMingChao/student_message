# == Schema Information
#
# Table name: votes
#
#  id                :integer          not null, primary key
#  students_forum_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#


			###################

   ##############          #################

#################学生论坛点赞模型######################

   ##############          #################

             ###################

class Vote < ApplicationRecord
	#########点赞与论坛内容的关系##################
  belongs_to :students_forum
end
