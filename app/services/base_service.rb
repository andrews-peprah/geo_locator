# Create class for base service
class BaseService
  def initialize(params)
    @params = params
    create_attr_accessors
  end

  def self.call(params)
    new(params).call
  end

  private

  def create_attr_accessors
    @params.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end
