# frozen_string_literal: true

class Plan < ApplicationRecord
  belongs_to :client
  belongs_to :provider

  validates :name, presence: true, inclusion: { in: [:basic, "basic", :premium, "premium"] }
end
