require 'wuid/ploymorphic_module'
require 'wuid/wuid'
require 'wuid/rand_gen'
ActiveRecord::Base.send :include, PloymorphicModule
