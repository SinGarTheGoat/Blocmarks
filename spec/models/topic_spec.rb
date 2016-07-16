require 'rails_helper'

RSpec.describe Topic, type: :model do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:topic) { Topic.create(title: 'Hey this is a great title', user: user)}
    it { is_expected.to belong_to(:user) }
    it { should validate_presence_of(:title) }
    describe 'validateions' do
      it 'validates uniqunes of title' do
        topic_2 = Topic.new(title: 'Hey this is a great title', user: user)
        expect(topic_2.valid?).to eq false
        topic_2.title = "something else"
        expect(topic_2.valid?).to eq true
      end

      it 'validates uniqunes of title scoped to user' do
        user_2 = FactoryGirl.create(:user)
        topic_2 = Topic.new(title: 'Hey this is a great title', user: user_2)
        expect(topic_2.valid?).to eq false
      end

    end



    describe 'attributes' do
        it 'has a title' do
            expect(topic).to have_attributes(title: 'Hey this is a great title')
        end
    end
end
