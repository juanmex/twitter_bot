module TwitterBot
  class Base
    def initialize(data = {})
      data.each do |attr, value|
        if attr_exist? attr
          var_name = "@#{attr}"
          self.instance_variable_set(var_name, value)
        else
          raise "Unkown attribute #{attr}"
        end
      end
    end

    def attributes
      self.class.attributes
    end

    class << self
      def attr_accessor(*vars)
        @attributes ||= []
        @attributes.concat vars
        super(*vars)
      end

      def attributes
        @attributes
      end
    end

    private

    def attr_exist?(attr)
      attributes.include?(attr.to_sym)
    end
  end
end
