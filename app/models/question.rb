class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :tags, dependent: :destroy
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :tags
end
