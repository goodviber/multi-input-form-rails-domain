module ResultNotifications
  class GroupTechnique< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :technique, class_name: "Testing::Technique"
  end
end
