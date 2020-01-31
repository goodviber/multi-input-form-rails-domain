module ResultNotifications
  class GroupMatrix< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :matrix, class_name: "Testing::Matrix"
  end
end
