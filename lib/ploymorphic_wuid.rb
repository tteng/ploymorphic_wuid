require 'wuid/ploymorphic_module'
require 'wuid/wuid'
ActiveRecord::Base.send :include, PloymorphicModule
