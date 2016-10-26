require 'json'
require './tamagotchi.rb'

use Rack::Static, :urls => ["/images"],
  :root => 'public'

class Pet
  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when '/'
      [200, {'Content-Type'  => 'text/html', 'Cache-Control' => 'public, max-age=86400'}, File.open('public/index.html', File::RDONLY)]
    when '/index.json'
      @@pet = Tamagotchi.new("Pikachu")
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/happy.png' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    when '/feed.json'
      @@pet.feed
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/eating.png' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    when '/walk.json'
      @@pet.walk
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/walk.gif' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    when '/put_to_bed.json'
      @@pet.put_to_bed
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/sleeping.jpg' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    when '/toss.json'
      @@pet.toss
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/toss.gif' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    when '/rock.json'
      @@pet.rock
      result = JSON.generate({ name: @@pet.name, stuff_in_belly: @@pet.stuff_in_belly, is_dead: @@pet.is_dead,
                                    stuff_in_intestine: @@pet.stuff_in_intestine, message: @@pet.message, image: '/images/rocking.jpg' })
      [200, {"Content-Type" => "text/json"}, [ result ]]
    else
      error_hash = JSON.generate({:result => "I'm Lost!"})
      [404, {"Content-Type" => "text/json"}, [error_hash]]
    end
  end
end



run Pet.new
# to run server 'rackup config.ru' in terminal