module ResultNotifications
  class GroupProduct< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :product, class_name: "Products::Product"
  end
end
