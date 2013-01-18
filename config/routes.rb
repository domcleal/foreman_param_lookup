Rails.application.routes.draw do
  match 'param_lookup', :to => 'foreman_param_lookup/classifications#lookup'
end
