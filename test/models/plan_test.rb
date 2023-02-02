# frozen_string_literal: true

require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  test 'ensure plan has both linkages' do
    plan = Plan.new(
      provider: nil,
      client: nil,
      name: :premium
    )
    refute plan.valid?
    assert_equal %i[client provider].sort, plan.errors.details.keys.sort
    plan.errors.details.each do |key, value|
      assert_equal :blank, value.first[:error], %(Oops! key #{key} value.first[:error] is not equal to :blank)
    end
  end

  test 'ensure plan has a client linkage' do
    provider = providers(:one)
    plan = Plan.new(
      provider:,
      client: nil,
      name: :basic
    )
    refute plan.valid?
    assert_equal %i[client], plan.errors.details.keys.sort,
                 %(Oops! plan.errors.details.keys.sort is not equal to %i[client])
    assert_equal :blank, plan.errors.details[:client].first[:error],
                 %(Oops! plan.errors.details[:client].first[:error] is not equal to :blank)
  end

  test 'ensure plan has a provider linkage' do
    client = clients(:one)
    plan = Plan.new(
      provider: nil,
      client:,
      name: :basic
    )
    refute plan.valid?
    assert_equal %i[provider], plan.errors.details.keys.sort,
                 %(Oops! plan.errors.details.keys.sort is not equal to %i[provider])
    assert_equal :blank, plan.errors.details[:provider].first[:error],
                 %(Oops! plan.errors.details[:provider].first[:error] is not equal to :blank)
  end

  test 'ensure plan name is either :basic or :premium, nothing else' do
    provider = providers(:one)
    client = clients(:one)

    plan = Plan.new(provider:, client:, name: :basic)
    assert plan.valid?, %(Oop! Plan should be valid)
    plan.name = :premium
    assert plan.valid?, %(Oops! Plan should be valid)

    plan.name = nil
    refute plan.valid? %(Oops! Plan should not be valid)
    assert_equal %i[name], plan.errors.details.keys.sort,
                 %(Oops! plan.errors.details.keys.sort is not equal to %i[name])
    assert_equal :blank, plan.errors.details[:name].first[:error],
                 %(Oops! plan.errors.details[:name].first[:error] is not equal to :blank)
    assert_equal :inclusion, plan.errors.details[:name].last[:error],
                 %(Oops! plan.errors.details[:name].last[:error] is not equal to :inclusion)

    plan.name = :bogus1
    refute plan.valid?, %(Oops! Plan should NOT be valid)
    assert_equal %i[name], plan.errors.details.keys.sort,
                 %(Oops! plan.errors.details.keys.sort is not equal to %i[name])
    assert_equal :inclusion, plan.errors.details[:name].first[:error],
                 %(Oops! plan.errors.details[:name].first[:error] is not equal to :inclusion)
  end
end
