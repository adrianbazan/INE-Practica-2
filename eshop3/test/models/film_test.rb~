require File.dirname(__FILE__) + '/../test_helper'

class FilmTest < ActiveSupport::TestCase
  fixtures :directors, :producers, :films, :directors_films

  test "failing_create" do
    film = Film.new
    assert_equal false, film.save
    assert_equal 8, film.errors.count
    assert film.errors[:title]
    assert film.errors[:producer_id]
    assert film.errors[:directors]
    assert film.errors[:produced_at]
    assert film.errors[:cod]
    assert film.errors[:blurb]
    assert film.errors[:duration]
    assert film.errors[:price]
  end

  test "create" do
    film = Film.new(
      :title => 'Ruby on Rails',
      :directors => Director.all,
      :producer_id => Producer.find(1).id,
      :produced_at => Time.now,
      :cod => '1234567890111',
      :blurb => 'A great book',
      :duration => 120,
      :price => 45.5
	
    )
  assert film.save
  end

  test "has_many_and_belongs_to_mapping" do
    apress = Producer.find_by_name("Apress");
    count = apress.films.count
    film = Films.new(
      :title => 'Pro Rails E-Commerce 8th Edition',
      :directors => [Director.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Director.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :producer_id => apress.id,
      :produced_at => Time.now,
      :cod => '1234567890111',
      :blurb => 'E-Commerce on Rails',
      :duration => 400,
      :price => 55.5
    )
    apress.films << film
    apress.reload
    film.reload
    assert_equal count + 1, apress.films.count
    assert_equal 'Apress', film.producer.name
  end

  test "has_many_and_belongs_to_many_authors_mapping" do
    film = Film.new(
      :title => 'Pro Rails E-Commerce 8th Edition',
      :directors => [Director.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Director.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :producer_id => Producer.find_by_name("Apress").id,
      :produced_at => Time.now,
      :cod => '1234567890111',
      :blurb => 'E-Commerce on Rails',
      :duration => 400,
      :price => 55.5
    )
    assert film.save
    film.reload
    assert_equal 2, film.directors.count
    assert_equal 2, Director.find_by_first_name_and_last_name('Joel', 'Spolsky').films.count
  end
end
