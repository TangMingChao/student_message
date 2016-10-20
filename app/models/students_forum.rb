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
            
            ###################

   ##############          #################

#################学生论坛模型######################

   ##############          #################

             ###################
class StudentsForum < ApplicationRecord
	#######论坛与评论和点赞的关系##############
	has_many :votes
	has_many :comments
	#############验证存在性###################
	validates :title,presence: true
	validates :description,presence: true


	# belongs_to :owner, class_name: "User", foreign_key: :user_id


	def editable_by?(user)
	  	# user && user == owner
	    user == user
 	end
end
