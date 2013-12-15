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
end
