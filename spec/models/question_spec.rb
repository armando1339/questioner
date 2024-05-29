require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { described_class.new(title: "Example", body: "example") }

  context "validations" do
    it "create a record with valid params" do
      expect(subject.save).to be_truthy
    end

    it "validates title presence" do
      subject.title = nil
      subject.save

      expect(subject.errors[:title]).to include("can't be blank")
    end

    it "validates body presence" do
      subject.body = nil
      subject.save

      expect(subject.errors[:body]).to include("can't be blank")
    end
  end
end
