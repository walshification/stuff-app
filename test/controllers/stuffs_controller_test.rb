require 'test_helper'

class StuffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @not_favorite_stuff = stuffs(:one)
    @favorite_stuff = stuffs(:two)
  end

  test 'GET index assigns all the stuff' do
    get(stuffs_path)
    assert_response(:success)
    assert_select('li', @not_favorite_stuff.name)
  end

  test 'POST create makes a new stuff' do
    post(stuffs_path, params: { stuff: { name: 'rspec', favorite: false } })
    assert_redirected_to(stuffs_path)
    follow_redirect!
    assert_select('li', 'rspec')
  end

  test 'GET favorite changes the stuff to a favorite stuff' do
    get("/stuffs/#{@not_favorite_stuff.id}/favorite", xhr: true)
    # returned javascript will act on our stuff
    assert_includes(response.body, "#stuff-#{@not_favorite_stuff.id}")
    # @not_favorite_stuff is now a favorite
    assert(Stuff.find(@not_favorite_stuff.id).favorite)
  end

  test 'GET unfavorite changes the stuff to not a favorite stuff' do
    get("/stuffs/#{@favorite_stuff.id}/unfavorite", xhr: true)
    # returned javascript will act on our stuff
    assert_includes(response.body, "#stuff-#{@favorite_stuff.id}")
    # @favorite_stuff is now not a favorite
    assert_not(Stuff.find(@favorite_stuff.id).favorite)
  end
end
