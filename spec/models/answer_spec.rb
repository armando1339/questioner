require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { described_class.new(body: "Example") }

  context "validations" do
    it "validates presence of body" do
      subject.body = nil
      subject.save

      expect(subject.errors[:body]).to include("can't be blank")
    end
  end

  context "associations" do
    it "have a one to one association with question model" do
      should belong_to(:question)
    end

    it "have a one to one association with user model" do
      should belong_to(:user).optional(true)
    end
  end
end
