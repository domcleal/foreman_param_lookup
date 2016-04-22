Rails.application.routes.draw do
  get 'param_lookup', :controller => 'foreman_param_lookup/classifications', :action => 'lookup'
end
