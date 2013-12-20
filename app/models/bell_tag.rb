# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: bell_tags
#
#  id         :integer          not null, primary key
#  tag_id     :integer
#  bell_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BellTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :bell
  # attr_accessible :title, :body
end
