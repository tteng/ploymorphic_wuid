module PloymorphicModule

  def self.included(base)
    base.extend ClassMethods
  end  

  module ClassMethods

    def acts_as_wuid options={}
      has_one :wuid, :as => :wuidable, :dependent => :destroy
      include PloymorphicModule::InstanceMethods
    end

  end

  module InstanceMethods

    def wid
      self.wuid.id
    end

    def after_create
      super
      create_wuid
    end

    def create_wuid
      wuid.create
    end

  end

end
