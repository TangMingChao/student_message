# == Schema Information
#
# Table name: feedbacks
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


            ###################

   ##############          #################

#################学生意见反馈模型######################

   ##############          #################

             ###################
class Feedback < ApplicationRecord
	##########验证 反馈内容的 存在性###########
	validates :content,presence:true
end
