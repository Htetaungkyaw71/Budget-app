require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'first', icon: 'img_url') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not too long' do
    subject.name = 'a' * 60
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
