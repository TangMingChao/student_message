# == Schema Information
#
# Table name: students_infos
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  sex                 :integer
#  number              :integer
#  phone               :string(255)
#  age                 :integer
#  email               :string(255)
#  birthday            :datetime
#  qq                  :string(255)
#  address             :string(255)
#  picture             :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null

#

			###################

   ##############          #################

#################学生信息资料模型######################

   ##############          #################

             ###################

class StudentsInfo < ApplicationRecord
	########################验证存在性##################
	validates :name,presence:true
	validates :number,presence:true
	validates :phone,presence:true
	validates :age,presence:true
	validates :email,presence:true
	validates :qq,presence:true
	validates :address,presence:true
	validates :sex,presence:true
	#############设置性别的格式##############
    SEXS = [[0,'男'],[1,'女']]




    ###############验证图片的格式################
	validates :picture, allow_blank: true, format: {
		with:%r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
}


    ##############添加图片大小设置#######################
    attr_accessor :picture
    mount_uploader :picture, PictureUploader

end
