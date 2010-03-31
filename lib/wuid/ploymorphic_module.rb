module PloymorphicModule

  def self.included(base)
    base.extend ClassMethods
  end  

  module ClassMethods

    def acts_as_wuid options={}
      #TODO auto set wuid with conditional hook
      has_one :wuid, :as => :wuidable, :dependent => :destroy
      attr_accessor :refs if options[:tree]
      include PloymorphicModule::InstanceMethods
    end

  end

  module InstanceMethods

    def wid
      (self.wuid.parent) ? self.parent.wid : self.wuid.id
    end

    def after_create
      super
      create_wuid
    end

    def create_wuid
      wuid.create :reference_to => refs
    end

  end

end
