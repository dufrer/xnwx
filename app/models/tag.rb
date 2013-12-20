# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  attr_accessible :title
  has_many :bell_tags, :dependent => :destroy
  has_many :bells, :through=> :bell_tags
end
