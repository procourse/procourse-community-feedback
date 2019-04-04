require 'rails_helper'

describe DiscourseFeedback::FeedbackController do
  let(:user) { Fabricate(:user) }
  let(:category) { Fabricate(:category) }

  describe "GET #post_feedback" do
    before do
      SiteSetting.procourse_community_feedback_category = category.name
      sign_in(user)
    end
    context "as an ordinary user" do
      it 'allow ordinary users to access' do
        get "/feedback/post_feedback.json?selected_emoji=heart_eyes&feedback_description=test_description"

        expect(response.status).to eq(204)

        topic = Topic.find_by(category_id: category.id)
        post = Post.where("raw LIKE '%Feedback Emoji%'").take(1)
        expect(post).to be_truthy
      end
    end
  end
end
