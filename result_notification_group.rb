module ResultNotifications
  class ResultNotificationGroup < ApplicationRecord
    belongs_to :company, class_name: "CRM::Company"

    has_many :group_company_branches
    has_many :company_branches, class_name: "CRM::CompanyBranch", through: :group_company_branches

    has_many :group_notifications, class_name: "::ResultNotifications::GroupNotification"
    has_many :notification_mechanisms, class_name: "::ResultNotifications::NotificationMechanism", through: :group_notifications

    has_many :group_people
    has_many :people, class_name: "CRM::Person", through: :group_people

    has_many :group_testing_categories
    has_many :testing_categories, class_name: "Testing::TestingCategory", through: :group_testing_categories

    has_many :group_techniques
    has_many :techniques, class_name: "Testing::Technique", through: :group_techniques

    has_many :group_matrices
    has_many :matrices, class_name: "Testing::Matrix", through: :group_matrices

    has_many :group_products
    has_many :products, class_name: "Products::Product", through: :group_products

    def expire
      update(expired: true)
    end

  end
end
