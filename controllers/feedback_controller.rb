class DiscourseFeedback::FeedbackController < ApplicationController

  requires_login

  def post_feedback
    feedback_category = SiteSetting.procourse_community_feedback_category

    if !params[:selected_emoji].nil? && !feedback_category.blank?
      feedback_count = ::PluginStore.get('discourse-feedback-plugin','feedback_count')
      feedback_count += 1
      ::PluginStore.set('discourse-feedback-plugin', 'feedback_count', feedback_count)

      selected_emoji = params[:selected_emoji]
      feedback_description = params[:feedback_description]

      if feedback_description.blank?
        feedback_raw = "**Feedback Emoji**: :#{selected_emoji}:"
      else
        feedback_raw = "**Feedback Emoji**: :#{selected_emoji}: \n**Feedback**: #{feedback_description}"
      end

      PostCreator.create(
          current_user,
          title: "Discourse Feedback Plugin Results - #{feedback_count}",
          raw: feedback_raw,
          category: feedback_category,
          skip_validations: true
        )
    end
  end
end
