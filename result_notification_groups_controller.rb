module ResultNotifications
  class ResultNotificationGroupsController < BaseController
    before_action :find_result_notification_group, only: [:edit, :update]

    # /result_notifications/result_notification_groups.json
    def index
      respond_to do |format|
        format.html
        format.json do
          @result_notification_groups = ResultNotificationGroup
            .where({company_id: params[:company_id], expired: false})
            .order(:created_at)
        end
      end
    end

    def update
      Services::EditResultNotificationGroup.new.({
        user_id: current_user.id,
        company_id: current_company.id,
        group: params[:group].to_h,
      }, &process_result_for_api)
    end

    def create
      Services::CreateResultNotificationGroup.new.({
        user_id: current_user.id,
        company_id: current_company.id,
        group: params[:group].to_h,
      }, &process_result_for_api)
    end

    def destroy
      Services::DeleteResultNotificationGroup.new.({
        result_notification_group_id: params[:id],
        user_id: current_user.id,
      }, &process_result_for_api)
    end


    private

    def find_result_notification_group
      @result_notification_group = ResultNotificationGroup.find(params[:group][:id])
    end

  end
end
