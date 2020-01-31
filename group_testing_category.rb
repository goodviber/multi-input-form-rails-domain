module ResultNotifications
  class GroupTestingCategory< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :testing_category, class_name: "Testing::TestingCategory"
  end
end
