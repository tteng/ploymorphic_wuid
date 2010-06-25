module PloymorphicModule

  def self.included(base)
    base.extend ClassMethods
  end  

  module ClassMethods

    def acts_as_wuid options={}
      default_options = { :as => :wuidable, :dependent => :destroy }
      default_options.merge!(options) unless options.empty?
      has_one :wuid, default_options 
      include PloymorphicModule::InstanceMethods
    end

  end

  module InstanceMethods

    def wid
      self.wuid.rand_token rescue nil
    end

    def after_create
      super
      create_wuid
    end

    def create_wuid
      begin 
        wuid.create!
      rescue ActiveRecord::StatementInvalid => e 
        logger.error " create wuid faild with #{e.message}"
        retry
      end
    end

  end

end
