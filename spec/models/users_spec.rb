require 'rails_helper'

RSpec.describe User, { type: :model } do
  subject {
    described_class.new(
      id: 11,
      username: 'tester',
      email: 'test@test.com',
      password: 'azerty',
      description: 'Description test',
      github_url: 'github@github.com',
      personal_url: 'personal@yopmail.com',
      favorite_theme: 'myTheme'
    )
  }
  it 'User is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'User is not valid without a username' do
    subject.username = nil
    expect(subject).to_not be_valid
  end
  it 'Username should be at least 4 chars' do
    subject.username = 'Bla'
    expect(subject).to_not be_valid
    subject.username = 'Blabla'
    expect(subject).to be_valid
  end
  it 'User is not valid without a valid formated email' do
    subject.email = nil
    expect(subject).to_not be_valid
    subject.email = 'yopmail.com'
    expect(subject).to_not be_valid
  end
  it 'Password should be at least 6 caracters' do
    subject.password = 'bla'
    expect(subject).to_not be_valid
  end
end
