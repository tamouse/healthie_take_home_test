# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :journal_entries, dependent: :destroy
  has_many :plans
  has_many :providers, through: :plans
end
