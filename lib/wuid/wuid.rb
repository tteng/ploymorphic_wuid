class Wuid < ActiveRecord::Base

  belongs_to :wuidable, :polymorphic => true

  before_validation do |record|
    record.rand_token = RandGen.generate
  end

  validates_uniqueness_of :rand_token

end
