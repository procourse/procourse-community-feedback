class DiscourseFeedback::FeedbackController < ApplicationController
  def post_feedback
    puts "Engine mounted"
    #First check for the existance of the topic
    feedback_topic_id = ::PluginStore.get('discourse-feedback-plugin','feddback_topic_id')

    if feedback_topic_id.blank?
      #create the topic if topic doesn't exists
      PostCreator.create(
          current_user,
          title: "Discourse Feedback Plugin Results",
          raw: "This is the content"
        )
    end
  end
end
