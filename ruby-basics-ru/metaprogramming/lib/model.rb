# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.class_eval do
        define_method :initialize do |args = {}|
          @attributes = args
          args.each do |key, value|
            self.instance_variable_set "@#{key}", value
            # super
          end
        end

        define_method :attributes do
          @attributes.each do |key, value|
            @attributes[key] = (self.method(key).call)
          end
          @attributes
        end

        define_singleton_method 'attribute' do |name, options = {}|
          define_method("#{name}") do
            convert_value(instance_variable_get("@#{name}"), options[:type])
          end

          define_method("#{name}=") do |value|
            @attributes[name] = value
            instance_variable_set("@#{name}", value)
          end
        end
    end
  end

  private 

  def convert_value(value, type)
    case type
    when :integer
      value.to_i
    when :string
      value.to_s
    when :datetime
      DateTime.parse(value.to_s)
    when :boolean
      !!value
    else
      value
    end
  end
end

# END
