module ResultNotifications
  module Schemas
    GroupSchema = Dry::Validation.Params do
      optional(:id).filled(:int?)
      required(:name).filled(:str?)
      required(:company_branches).maybe(:array?)
      required(:people).filled(:array?)
      required(:notification_mechanisms).filled(:array?)
      required(:testing_categories).maybe(:array?)
      required(:techniques).maybe(:array?)
      required(:matrices).maybe(:array?)
      required(:products).maybe(:array?)
    end
  end
end
