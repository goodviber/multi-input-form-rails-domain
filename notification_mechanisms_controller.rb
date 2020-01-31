module ResultNotifications
  class NotificationMechanismsController < BaseController

    def index
      notification_mechanisms = NotificationMechanism.order(:created_at)
      render json: notification_mechanisms
    end

  end
end
