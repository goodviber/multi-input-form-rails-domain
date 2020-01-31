module ResultNotifications
  class BaseController < ApplicationController
    prepend_view_path "app/domains"
    prepend_view_path "app/domains/result_notifications"

    #before_action :ensure_laboratory_user!
  end
end
