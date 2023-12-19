Rails.application.routes.draw do
  mount GeoLocator::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
