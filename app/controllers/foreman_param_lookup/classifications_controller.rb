module ForemanParamLookup
  class ClassificationsController < ::ApplicationController
    skip_before_filter :require_login, :only => :lookup
    skip_before_filter :require_ssl, :only => :lookup
    skip_before_filter :authorize, :only => :lookup
    skip_before_filter :set_taxonomy, :only => :lookup
    skip_before_filter :session_expiry, :update_activity_time, :only => :lookup
    before_filter :set_admin_user, :only => :lookup

    def lookup
      host = Host.find_by_name(params[:host])
      ppclass = Puppetclass.find_by_name(params[:class])
      unless host and ppclass
        head :status => 404
        return
      end
      render :text => AnyClassification.new(
        :host => host, :classes => [ppclass].flatten
      ).enc.to_yaml
    end
  end
end
