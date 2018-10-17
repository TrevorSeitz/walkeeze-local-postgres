DATA = {
  :user_keys =>
    ["name", "email", "uid", "image", "password_digest", "provider"],
  :users => [
    ["Bob", "bob@email.com", 1, "", "$2a$10$HDh5e87ILdPqAoA0WLXjwO4d6samm0X5XhpCKQmslfJUmwXNV/7nq", ""],
    ["Ray", "ray@email.com", 2, "", "$2a$10$HDh5e87ILdPqAoA0WLXjwO4d6samm0X5XhpCKQmslfJUmwXNV/7nq", ""],
    ["Hank", "hank@email.com", 3, "", "$2a$10$HDh5e87ILdPqAoA0WLXjwO4d6samm0X5XhpCKQmslfJUmwXNV/7nq", ""]
  ],
  :dog_keys =>
   ["name", "breed", "age", "user_id", "notes"],
  :dogs => [
    ["Snoopy", "Beagle", 2, 1, ""],
    ["Lady", "Spqniel", 3, 1, ""],
    ["Scooby", "Mutt", 9, 2 ,""],
    ["Lassie", "Collie", 5, 3, ""],
    ["Bolt", "Shepard", 1, 3, ""]
  ],
  :walk_keys =>
   ["walker_name", "date", "time", "length", "available_spots", "notes"],
   :walks => [
     ["Fred", "2018-8-8", "12:00", 45, 5, "Water"],
     ["Billy", "2018-8-8", "15:00", 60, 3, "Water and Treats"],
     ["Lulu", "2018-8-8", "17:00", 30, 2, "Dog Park"]
   ],
   :dogs_walk_keys =>
    ["dog_id", "walk_id", "notes"],
    :dogs_walks => [
      ["1", "1", "no notes today"],
      ["2", "1", "no notes today"],
      ["3", "1", "no notes today"],
      ["1", "2", "no notes today"],
      ["4", "2", "no notes today"],
      ["5", "2", "no notes today"],
      ["1", "3", "no notes today"],
      ["4", "3", "no notes today"]
    ]
}

def main
  make_users
  make_dogs
  make_walks
  make_dogs_walks
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_dogs
  DATA[:dogs].each do |dog|
    new_dog = Dog.new
    dog.each_with_index do |attribute, i|
      new_dog.send(DATA[:dog_keys][i]+"=", attribute)
    end
    new_dog.save
  end
end

def make_walks
  DATA[:walks].each do |walk|
    new_walk = Walk.new
    walk.each_with_index do |attribute, i|
      new_walk.send(DATA[:walk_keys][i]+"=", attribute)
    end
    new_walk.save
  end
end

def make_dogs_walks
  DATA[:dogs_walks].each do |dogs_walk|
    new_dogs_walk = DogsWalk.new
    dogs_walk.each_with_index do |attribute, i|
      new_dogs_walk.send(DATA[:dogs_walk_keys][i]+"=", attribute)
    end
    new_dogs_walk.save
  end
end

main
