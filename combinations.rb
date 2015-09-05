class User
  attr_accessor :preferences,
                :name

  @@users_collection = []

  def initialize(name, preferences)
    @name = name
    @preferences = preferences
    @@users_collection << self
  end

  def self.all
    @@users_collection
  end

  def self.all_pairs
    pairs = []
    all.each do |user|
      all.length.times do |num|
      pairs << [user, all[num]]
      end
    end
    unique_pairs = pairs.map { |pair| pair.sort_by { |user| user.name } }
    .uniq
    .reject { |pair| pair if pair[0] == pair[1] }
    unique_pairs
  end

  def assign(top_choice)
    @work_day = top_choice
  end
end

User.new("lev", [0, 1])
User.new("sar", [2, 3])
User.new("josh", [2, 1])
User.new("eli", [1, 3])
User.new("zell", [2, 1])
User.new("emily", [0, 1])

week = []
7.times do |n|
  random_user = User.all.sample
  top_choice  = random_user.preferences.index(1)
  week        << random_user
  random_user.assign(top_choice)
end
week.map {|u| u.name}

User.all_pairs.combination(7).to_a.map {|week| Schedule.score(week)}

class Schedule
  def self.score(week)
    count = 0
    week.each_with_index do |pair, index|
      
    end
  end
end
