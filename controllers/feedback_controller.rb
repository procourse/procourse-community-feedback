class DiscourseFeedback::FeedbackController < ApplicationController
  def post_feedback
    selected_emoji = params[:selected_emoji]
    # PostCreator.create(
    #     current_user,
    #     title: "Discourse Feedback Plugin Results",
    #     raw: "This is the content",
    #     skip_validations: true
    #   )
  end
end
