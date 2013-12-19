# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: bells
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  zone           :string(255)
#  file_location  :string(255)
#  file_size      :integer
#  broadcast_time :integer
#  singer         :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Bell < ActiveRecord::Base
  attr_accessible :broadcast_time, :file_location, :file_size, :name, :singer, :zone
  validates :name,:presence => true, :allow_blank => false
  validates :file_size,:presence => true, :allow_blank => false,:numericality => true
  validates :broadcast_time,:presence => true, :allow_blank => false,:numericality => true
  validates :singer, :presence => true , :allow_blank => false
  validates :file_location, :presence => true , :allow_blank => false
  validates :zone, :presence => true , :allow_blank => false

  validate :caculate_file_message

  def caculate_file_message
    logger.info "-"*100
    logger.info file_location.file.inspect
    if file_location? and file_location.file.size > 1024*1024*30
      errors.add(:file_location, "附件大小超过30M限制")
    end
  end 

  extend Enumerize
  extend ActiveModel::Naming
  enumerize :zone, in: [:zh, :en], default: "zh", scope: true

  mount_uploader :file_location, BellUploader

end
