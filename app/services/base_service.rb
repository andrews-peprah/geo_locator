# Create class for base service
class BaseService
  def initialize(params)
    @params = params
  end

  def call
    raise NotImplementedError
  end
end
