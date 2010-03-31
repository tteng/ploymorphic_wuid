class Wuid < ActiveRecord::Base
  acts_as_tree :foreign_key => "reference_to"
  belongs_to :wuidable, :polymorphic => true
end


