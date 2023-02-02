# frozen_string_literal: true

class JournalEntry < ApplicationRecord
  belongs_to :client

  before_validation :ensure_posted_at
  before_validation :ensure_published_is_boolean

  validates :published, inclusion: { in: [true, false] }

  scope :published, -> { where(published: true) }
  scope :drafts, -> { where.not(published: true) }

  def publish!
    return if published?

    self.published = true
    self.posted_at = Time.current
  end

  private

  def ensure_published_is_boolean
    return unless published.nil?

    self.published = false
  end

  def ensure_posted_at
    return unless posted_at.nil?

    self.posted_at = Time.current
  end
end
