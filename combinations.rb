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

  # def assign(top_choice)
  #   @work_day = top_choice
  # end
end

# week = []
# 7.times do |n|
#   random_user = User.all.sample
#   top_choice  = random_user.preferences.index(1)
#   week        << random_user
#   random_user.assign(top_choice)
# end
# week.map {|u| u.name}

User.new("lev",   [0,1,2,3,0,0,0])
User.new("sar",   [2,3,0,0,1,0,0])
User.new("josh",  [0,0,2,0,1,3,0])
User.new("eli",   [2,0,0,0,1,0,3])
User.new("zell",  [3,0,1,0,2,0,0])
User.new("emily", [1,2,0,3,0,0,0])

class Schedule
  def self.score(week)
    count = 0
    week.each_with_index do |pair, index|
      case pair[0].preferences[index]
      when 3 then count += 5
      when 2 then count += 3
      when 1 then count += 1
      when 0 then count -= 5
      end

      case pair[1].preferences[index]
      when 3 then count += 5
      when 2 then count += 3
      when 1 then count += 1
      when 0 then count -= 5
      end
    end
    week.zip([count])
  end
end

User.all_pairs.combination(7).to_a.map { |week| Schedule.score(week) }
