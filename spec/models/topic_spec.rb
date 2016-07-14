require 'rails_helper'

RSpec.describe Topic, type: :model do
    let(:user) { create(:user) }
    let(:topic) { Topic.create(title: 'Hey this is a great title', user: user)}
    it { is_expected.to belong_to(:user) }

    describe 'attributes' do
        it 'has a title' do
            expect(topic).to have_attributes(title: 'Hey this is a great title')
        end
    end
end
