require 'rails_helper'

describe 'the routing config for the Notes resources' do

  let(:uuid) { SecureRandom.uuid }

  it 'routes GET /notes to notes#index' do
    expect( get: '/notes' ).to route_to(
      controller: 'notes',
      action:     'index',
      format:     :json
    )
  end

  it 'does not route GET /notes/:id' do
    expect( get: "/notes/#{uuid}" ).to_not be_routable
  end

  it 'does not route POST /notes' do
    expect( post: '/notes' ).to_not be_routable
  end

  it 'does not route PUT /notes/:id' do
    expect( put: "/notes/#{uuid}" ).to_not be_routable
  end

  it 'does not route PATCH /notes/:id' do
    expect( patch: "/notes/#{uuid}" ).to_not be_routable
  end

  it 'does not route DELETE /sonders/:id' do
    expect( delete: "/notes/#{uuid}" ).to_not be_routable
  end

end
