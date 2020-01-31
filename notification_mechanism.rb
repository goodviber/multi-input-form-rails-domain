module ResultNotifications
  class NotificationMechanism < ApplicationRecord
    has_many :group_notifications
    has_many :result_notification_groups, through: :group_notifications

    validates :name, presence: true
  end
end
