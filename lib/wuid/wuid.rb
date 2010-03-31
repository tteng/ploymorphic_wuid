class Wuid < ActiveRecord::Base
  belongs_to :wuidable, :polymorphic => true
end


