module PloymorphicModule

  def self.included(base)
    base.extend ClassMethods
  end  

  module ClassMethods

    def acts_as_wuid
      has_one :wuid, :as => :wuidable, :dependent => :destroy
      include PloymorphicModule::InstanceMethods
    end

  end

  module InstanceMethods

    def after_create 
      super
      create_wuid
    end 

    def create_wuid
      wuid.create
    end
 
    def wid
      wuid.id
    end

  end

end


