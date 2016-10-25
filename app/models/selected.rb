class Selected < ActiveRecord::Base
  belongs_to :pick_1, :class_name => 'Hero', :foreign_key => 'pick_1_id'
  belongs_to :pick_2, :class_name => 'Hero', :foreign_key => 'pick_2_id'
  belongs_to :pick_3, :class_name => 'Hero', :foreign_key => 'pick_3_id'
  belongs_to :pick_4, :class_name => 'Hero', :foreign_key => 'pick_4_id'
  belongs_to :pick_5, :class_name => 'Hero', :foreign_key => 'pick_5_id'
  #has_many :heroes
  belongs_to :match
end
