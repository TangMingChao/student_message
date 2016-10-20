# == Schema Information
#
# Table name: photos
#
#  id                   :integer          not null, primary key
#  title                :string(255)
#  description          :text(65535)
#  picture              :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#


			###################

   ##############          #################

#################学生相册模型######################

   ##############          #################

             ###################
class Photo < ApplicationRecord

	######验证标题描述内容的存在性，也就是标题和描述的内容不能为空########
	validates :title,presence: true
	validates :description,presence: true

	###############验证图片的格式################
	validates :picture, allow_blank: true, format: {
with:%r{\.(gif|jpg|png)\Z}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}

    ##############添加图片大小设置#######################
    attr_accessor :picture
    mount_uploader :picture, PictureUploader


end
