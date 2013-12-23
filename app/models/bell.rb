# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: bells
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  zone          :string(255)
#  file_location :string(255)
#  file_size     :integer
#  duration      :string(255)
#  singer        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# -*- encoding : utf-8 -*-
class Bell < ActiveRecord::Base
  attr_accessor :tag_names
  attr_accessible :duration, :file_location, :file_size, :name, :singer, :zone,:tag_ids
  validates :name,:presence => true, :allow_blank => false
  validates :file_size,:presence => true, :allow_blank => false,:numericality => true,:on=>:update 
  validates :duration,:presence => true, :allow_blank => false,:on=>:update
  validates :singer, :presence => true , :allow_blank => false
  validates :file_location, :presence => true , :allow_blank => false
  validates :zone, :presence => true , :allow_blank => false

  has_many :bell_tags, :dependent => :destroy
  has_many :tags, :through=> :bell_tags

  validate :caculate_file_message

  before_validation :caculate_file_broadcast_time 	

  def caculate_file_broadcast_time
	video = WebVideo::Adapters::FfmpegAdapter.new( file_location.current_path)
	self.duration= video.duration
	self.file_size= video.size
  end 
   
  def caculate_file_message
    if file_location? and file_location.file.size > 1024*1024*5
      errors.add(:file_location, "附件大小超过5M限制")
    end
  end 

  extend Enumerize
  extend ActiveModel::Naming
  enumerize :zone, in: [:zh, :en], default: "zh", scope: true

  mount_uploader :file_location, BellUploader

  scope :search , lambda{|params|
    includes(:bell_tags).where{
      conds = []
      conds << ( zone.eq params[:zone] ) if params[:zone].present?
      #conds << ( bell_tags.bell_id >>  Tag.where(:title => params[:tag_name] )) if params[:tag_name].present?
      conds << ( bell_tags.tag_id.eq params[:tag_id] ) if params[:tag_id].present?
      conds.inject{| conds_total , con |  conds_total &= con }
    }
  }

end
