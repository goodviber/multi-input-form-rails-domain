module ResultNotifications
  module Services
    class EditResultNotificationGroup < Service

      # This class edits  a result_notification_group

      Schema = Dry::Validation.Params do
        required(:user_id).filled(:int?)
        required(:company_id).filled(:int?)
        required(:group) do
          schema(Schemas::GroupSchema)
        end
      end

      attr_reader :user, :company, :values

      def call(params)
        @values = yield validate(Schema, params)
        @user = User.find values[:user_id]
        @company = ::CRM::Company.find values[:company_id]
        @group = ResultNotificationGroup.find values[:group][:id]

        yield authorise_user

        result_notification_group = @group.update(
          name: values[:group][:name],
          include_failed_results: params[:group][:include_failed_results],
          include_warning_results: params[:group][:include_warning_results],
          company_branch_ids: values[:group][:company_branches],
          notification_mechanism_ids: values[:group][:notification_mechanisms],
          person_ids: values[:group][:people],
          testing_category_ids: values[:group][:testing_categories],
          technique_ids: values[:group][:techniques],
          matrix_ids: values[:group][:matrices],
          product_ids: values[:group][:products]
        )

        Success(result_notification_group)
      end

      private

      def authorise_user
        errors = []

        if authoriser.client_user?
          errors << "You have insufficient permissions to edit a result notification group" unless authoriser.has_client_permission?("manage_notifications")
        end

        if authoriser.laboratory_user?
          errors << "You have insufficient permissions to edit a result notification group" unless authoriser.authorise?("manage_client_notifications")
        end

        if errors.any?
          Failure(errors: errors)
        else
          Success({})
        end
      end

    end
  end
end
