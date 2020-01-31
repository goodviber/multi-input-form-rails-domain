module ResultNotifications
  class GroupCompanyBranch< ApplicationRecord
    belongs_to :result_notification_group
    belongs_to :company_branch, class_name: "CRM::CompanyBranch"
  end
end
