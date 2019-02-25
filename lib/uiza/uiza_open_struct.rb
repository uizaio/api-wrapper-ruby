module Uiza
  class UizaOpenStruct < OpenStruct
    def define_methods()
      data = to_h
      data.each do |key, value|
        if value.is_a?(Uiza::UizaOpenStruct)
          value.define_methods()
        else
          self.define_singleton_method(key) do |*args|
            return super(*args) if args.any?
            value
          end
        end
      end
    end
  end
end
