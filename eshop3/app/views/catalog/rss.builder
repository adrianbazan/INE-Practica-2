xml.instruct!
  xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
    xml.channel do
      xml.title @page_title
      xml.description "Crazy Films: Películas para ti"
      xml.link url_for :action => 'index', :only_path => false
      xml.language "es-ES"
      xml.ttl "60"
      for film in @films do
        xml.item do
        xml.title film.title
        xml.description "#{film.title} by #{film.director_names}"
	xml.link url_for :action => "show", :id => film, :only_path => false
	xml.guid url_for :action => "show", :id => film, :only_path => false
	xml.pubDate film.created_at.to_s :long
	xml.director film.director_names
      end
    end
  end
end
