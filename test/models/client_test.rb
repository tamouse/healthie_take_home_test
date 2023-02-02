require "test_helper"

class ClientTest < ActiveSupport::TestCase
  setup do
    @client_one = clients(:one)
    @provider_one = providers(:one)
    @provider_two = providers(:two)
  end

  test 'link client to a provider' do
    plan = Plan.new(
      client_id: @client_one.id,
      provider_id: @provider_one.id,
      name: :basic
    )

    assert plan.save!
    # binding.pry
    assert_equal 1, @client_one.providers.count, %{Oops! @client_one.providers.count is not equal to 1}
    assert_equal @provider_one.id, @client_one.providers.first.id, %{Oops! @client_one.providers.first.id is not equal to @provider_one.id}
  end

  test 'link client to multiple providers' do
    plan_one = Plan.new(
      client_id: @client_one.id,
      provider_id: @provider_one.id,
      name: :basic
    )

    assert plan_one.save!

    plan_two = Plan.new(
      client_id: @client_one.id,
      provider_id: @provider_two.id,
      name: :basic
    )

    assert plan_two.save!
    assert_equal 2, @client_one.providers.count, %{Oops! @client_one.providers.count is not equal to 2}
    assert_equal [@provider_one.id, @provider_two.id].sort,
                 @client_one.providers.ids.sort,
                 %{Oops! actual is not equal to sort(@provider_one.id, @provider_two.id)}
  end
end
