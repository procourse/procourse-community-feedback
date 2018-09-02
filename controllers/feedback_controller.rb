class DiscourseFeedback::FeedbackController < ApplicationController
  def post_feedback
    feedback_count = ::PluginStore.get('discourse-feedback-plugin','feedback_count')
    feedback_count += 1
    ::PluginStore.set('discourse-feedback-plugin', 'feedback_count', feedback_count)

    selected_emoji = params[:selected_emoji]

    PostCreator.create(
        current_user,
        title: "Discourse Feedback Plugin Results - #{feedback_count}",
        raw: "Feedback : :#{selected_emoji}:",
        category: "user-feedback",
        skip_validations: true
      )
  end
end
