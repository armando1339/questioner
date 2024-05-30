require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "armando@example.com", password: "1234567890", password_confirmation: "1234567890")
  }

  context "validations" do
    it "validates email presence" do
      subject.email = nil
      subject.save
      
      expect(subject.errors[:email]).to include("can't be blank")
    end

    it "validates email format" do
      subject.email = "no-format"
      subject.save
      
      expect(subject.errors[:email]).to include("is invalid")
    end

    it "validates email format" do
      subject.save
      user = described_class.create(email: "armando@example.com", password: "0987654321")
      
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

  context "associations" do
    it "should have a one to one association with user" do
      should have_many(:answers)
    end
  end

  describe "#generate_jwt" do
    it "generate a token" do
      subject.save
      
      expect(subject.generate_jwt).not_to be_nil
      expect(subject.jwt).not_to be_nil
    end
  end
end
