# frozen_string_literal: true

class Provider < ApplicationRecord
  has_many :plans
  has_many :clients, through: :plans
  has_many :journal_entries, through: :clients
end
