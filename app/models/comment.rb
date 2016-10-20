# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text(65535)
#  students_forum_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#




            ###################

   ##############          #################

#################学生论坛评论馈模型######################

   ##############          #################

             ###################

class Comment < ApplicationRecord
	##########验证评论和学生论坛的关系##########
  belongs_to :students_forum
     ############验证评论内容的存在性###########
  validates :content,presence:true

end
