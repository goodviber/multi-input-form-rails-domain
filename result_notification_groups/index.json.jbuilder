json.array! @result_notification_groups do |group|
  json.id group.id
  json.name group.name
  json.company_id group.company_id
  json.include_failed_results group.include_failed_results
  json.include_warning_results group.include_warning_results
  json.expired group.expired
  json.created_at group.created_at
  json.updated_at group.updated_at
  json.company_branches group.company_branches, :id, :name
  json.notification_mechanisms group.notification_mechanisms, :id, :name
  json.people group.people, :id, :name
  json.testing_categories group.testing_categories, :id, :name
  json.techniques group.techniques, :id, :name
  json.matrices group.matrices, :id, :name
  json.products group.products, :id, :name
end
