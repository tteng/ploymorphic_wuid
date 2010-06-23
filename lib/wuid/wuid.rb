class Wuid < ActiveRecord::Base

  belongs_to :wuidable, :polymorphic => true

  before_validation do |record|
    record.rand_token = RandGen.generate
  end

  validates_uniqueness_of :rand_token

  def self.find(*args)
    options = args.extract_options!
    validate_find_options(options)
    set_readonly_option!(options)
    case args.first
      when :first
        find_initial(options)
      when :last
        find_last(options)
      when :all
        find_every(options)
      else
        expects_array = args.first.is_a?(Array)
        return args.first if expects_array && args.first.empty?
        case args.size
          when 0
            raise RecordNotFound, "Couldn't find #{name} without an ID"
          when 1
            if args[0].is_a?(Integer) || (args[0].is_a?(String) && args[0] =~ /^\d{1,}$/)
              super
            else
              if args[0].is_a?(Array)
                if args[0].all?{|i| i.is_a?(Integer)} ||  args[0].all?{|i| i=~ /^\d{1,}$/}
                  super
                else
                  origin_find(:all, :conditions => ["rand_token in (?)", args[0]])
                end
              else
                origin_find(:first, :conditions => ["rand_token = ?", args[0]])
              end
            end #  if args[0].is_a?(Integer) || (args[0].is_a?(String) && args[0] =~ /^\d{1,}$/)
        end # case args.size
    end #case args.first   
  end

  class << self
    alias origin_find find
  end
 
end
