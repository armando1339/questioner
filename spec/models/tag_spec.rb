require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { described_class.new(name: "Example") }

  context "validations" do
    it "validates presence of name" do
      subject.name = nil
      subject.save

      expect(subject.errors[:name]).to include("can't be blank")
    end
  end

  context "associations" do
    it "have a one to one association with question model" do
      should belong_to(:question)
    end
  end
end
