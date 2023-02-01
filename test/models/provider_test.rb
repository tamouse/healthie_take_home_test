require "test_helper"

class ProviderTest < ActiveSupport::TestCase
  setup do
    @provider = providers(:one)
    @client1 = clients(:one)
    @client2 = clients(:two)
  end

  test 'link a provider to a client' do
    plan = Plan.new(
      provider_id: @provider.id,
      client_id: @client1.id,
      name: :premium
    )

    assert plan.save!
    assert_equal 1, @provider.clients.count, %{Oops! @provider.clients.count is not equal to 1}
    assert_equal @client1.id, @provider.clients.first.id, %{Oops! @provider.clients.first.id is not equal to @client1.id}
  end

  test 'link provider to multiple clients' do
    plan1 = Plan.new(
      provider_id: @provider.id,
      client_id: @client1.id,
      name: :premium
    )
    assert plan1.save!

    plan2 = Plan.new(
      provider_id: @provider.id,
      client_id: @client2.id,
      name: :basic
    )
    assert plan2.save!

    assert_equal 2, @provider.clients.count, %{Oops! @provider.clients.count is not equal to 2}
    assert_equal [@client1.id, @client2.id].sort,
                 @provider.clients.ids.sort,
                 %{Oops! actual is not equal to [@client1.id, @client2.id].sort}
  end
end
