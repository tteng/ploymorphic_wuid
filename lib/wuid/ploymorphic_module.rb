module PloymorphicModule

  def self.included(base)
    base.extend ClassMethods
  end  

  module ClassMethods

    def acts_as_wuid options={}
      #TODO auto set wuid with conditional hook
      has_one :wuid, :as => :wuidable, :dependent => :destroy
      if options[:acts_as_tree]
        Wuid.class_eval do
          acts_as_tree :foreign_key => "reference_to"
        end
        include PloymorphicModule::AdvancedInstanceMethods
      else
        include PloymorphicModule::InstanceMethods
      end
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
      self.wuid.id
    end

  end

  module AdvancedInstanceMethods

    def wid
      (self.respond_to?(:reference_to) && self.parent) ? self.parent.wid : self.wuid.id
    end

    def wid= id
      w = self.wuild.build :reference_to => id
      w.save 
    end

  end

end
