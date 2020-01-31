module ResultNotifications
  class GroupNotification< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :notification_mechanism, class_name: "::ResultNotifications::NotificationMechanism"
  end
end
