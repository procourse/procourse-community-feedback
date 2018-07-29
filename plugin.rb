# name: procourse-community-feedback
# about: Adds a popup for Discourse that asks users for feedback.
# version: 0.1
# authors: Procourse Team
# url: https://github.com/procourse/procourse-community-feedback

enabled_site_setting :procourse_community_feedback_enabled

register_asset 'stylesheets/procourse-feedback.scss'

after_initialize do
end
