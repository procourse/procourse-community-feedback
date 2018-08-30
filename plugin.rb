# name: procourse-community-feedback
# about: Adds a popup for Discourse that asks users for feedback.
# version: 0.1
# authors: Procourse Team
# url: https://github.com/procourse/procourse-community-feedback

enabled_site_setting :procourse_community_feedback_enabled

register_asset 'stylesheets/procourse-feedback.scss'

after_initialize do

  module ::DiscourseFeedback
    class Engine < ::Rails::Engine
      engine_name 'discourse_feedback'
      isolate_namespace DiscourseFeedback
    end
  end

  load File.expand_path('../controllers/feedback_controller.rb',__FILE__)

  DiscourseFeedback::Engine.routes.draw do
    get "/post_feedback" => "feedback#post_feedback"
  end

  Discourse::Application.routes.prepend do
    mount ::DiscourseFeedback::Engine, at: "/feedback"
  end
end
