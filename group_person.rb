module ResultNotifications
  class GroupPerson< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :person, class_name: "CRM::Person"
  end
end
