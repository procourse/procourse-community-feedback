class DiscourseFeedback::FeedbackController < ApplicationController
  def post_feedback
    if !current_user.nil? && !params[:selected_emoji].nil? && !params[:feedback_description] 
      feedback_count = ::PluginStore.get('discourse-feedback-plugin','feedback_count')
      feedback_count += 1
      ::PluginStore.set('discourse-feedback-plugin', 'feedback_count', feedback_count)

      selected_emoji = params[:selected_emoji]
      feedback_description = params[:feedback_description]

      PostCreator.create(
          current_user,
          title: "Discourse Feedback Plugin Results - #{feedback_count}",
          raw: "Feedback Emoji: :#{selected_emoji}: \nFeedback: #{feedback_description}",
          category: "user-feedback",
          skip_validations: true
        )
    end
  end
end
