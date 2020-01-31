module ResultNotifications
  module Services
    class DeleteResultNotificationGroup < Service

      # This class expires a result_notification_group.

      Schema = Dry::Validation.Params do
        required(:result_notification_group_id).filled(:int?)
        required(:user_id).filled(:int?)
      end

      attr_reader :result_notification_group, :user, :values

      def call(params)
        @values = yield validate(Schema, params)
        @result_notification_group = ResultNotificationGroup.find values[:result_notification_group_id]
        @user = User.find values[:user_id]

        yield authorise_user

        result_notification_group.expire
        Success({})
      end

      private

      # Returns an array of errors:  ["Cannot delete user because..", "Cannot..."]
      def authorise_user
        errors = []

        if authoriser.client_user?
          errors << "You have insufficient permissions to delete a result notification group" unless authoriser.has_client_permission?("manage_notifications")
        end

        if authoriser.laboratory_user?
          errors << "You have insufficient permissions to delete a result notification group" unless authoriser.authorise?("manage_client_notifications")
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
