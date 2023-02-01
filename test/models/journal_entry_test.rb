# frozen_string_literal: true

require "test_helper"

class JournalEntryTest < ActiveSupport::TestCase
  setup do
    @client1 = clients(:one)
  end

  test 'client 1 initialized with 3 journal entries' do
    assert_equal 3, @client1.journal_entries.count, %(Oops! @client1.journal_entries.count is not equal to 3)
  end

  test 'client 1 has one published journal entry' do
    assert_equal 1, @client1.journal_entries.published.count,
                 %(Oops! @client1.journal_entries.published is not equal to 1)
  end

  test 'client 1 has two draft entries' do
    assert_equal 2, @client1.journal_entries.drafts.count,
                 %(Oops! @client1.journal_entries.drafts.count is not equal to 2)
  end
end
