# frozen_string_literal: true

# Runner to demonstrate the queries for the take home test

class QueriesForTht
  def all
    puts "\nQueries for Database Modeling portion of Take Home Test"
    puts "-------------------------------------------------------\n"
    all_clients_for_a_provider
    all_providers_for_a_client
    journal_entries_for_a_client_sorted
    journal_entries_for_all_clients_of_a_provider
  end


  def all_clients_for_a_provider
    puts "\nFind all clients for a particular provider:"
    provider = Provider.all.sample
    clients = provider.clients
    puts "#{clients.count} clients for provider #{provider.name}"
    clients.each do |client|
      puts "Client #{client.name}"
    end
  end

  def all_providers_for_a_client
    puts "\nFind all providers for a particular client"
    client = Client.all.sample
    providers = client.providers
    puts "#{providers.count} providers for client #{client.name}"
    providers.each do |provider|
      puts "Provider: #{provider.name}"
    end
  end

  def journal_entries_for_a_client_sorted
    puts "\nFind all of a particular client's journal entries, sorted by date posted"
    client = Client.all.sample
    client.journal_entries.order(posted_at: :asc).each do |entry|
      puts "Entry posted at #{entry.posted_at}"
    end
  end

  def journal_entries_for_all_clients_of_a_provider
    puts "\nFind all of the journal entries of all of the clients of a particular provider, sorted by date posted"
    provider = Provider.all.sample
    entries = provider.journal_entries.order(posted_at: :asc)
    puts "#{entries.count} entries for all clients of provider #{provider.name}"
    entries.each do |entry|
      puts "Entry posted at #{entry.posted_at}"
    end
  end
end

QueriesForTht.new.all
