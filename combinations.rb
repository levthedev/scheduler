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


# lev/sar
# eli/lev
# lev/zell
# emily/lev
# josh/zell
# emily/josh
# eli/zell


class Schedule
  def self.scores
    @@scores
  end

  def self.score(week)
    count = 0
    @@scores ||= Hash.new(0)
    week.each_with_index do |pair, index|
      case pair[0].preferences[index]
      when 3 then count += 5
      when 2 then count += 3
      when 1 then count += 1
      when 0 then count -= 2
      end

      case pair[1].preferences[index]
      when 3 then count += 5
      when 2 then count += 3
      when 1 then count += 1
      when 0 then count -= 5
      end
    end
    @@scores[week] += count
  end

  def self.best
    filtered_scores = @@scores

    filtered_scores.max_by(3) do |week, score|
      score
    end.each do |week|
      week.first.each { |pair| printf "#{pair[0].name}/#{pair[1].name}\n\n"}
    end
  end
end

User.all_pairs.combination(7).to_a.map { |week| Schedule.score(week)}
Schedule.best

#User.all_pairs.combination(7).to_a.length
#User.all_pairs.combination(7).to_a.map { |week| Schedule.score(week) }  # => [[[[#<User:0x007f9b4481eb88 @name="lev", @preferences=[0, 1, 2, 3, 0, 0, 0]>, #<User:0x007f9b4481de68 @name="sar", @preferences=[2, 3, 0, 0, 1, 0, 0]>], -26], [[#<User:0x007f9b4481d0f8 @name="josh", @preferences=[0, 0, 2, 0, 1, 3, 0]>, #<User:0x007f9b4481eb88 @name="lev", @preferences=[0, 1, 2, 3, 0, 0, 0]>], nil], [[#<User:0x007f9b4481c068 @name="eli", @preferences=[2, 0, 0, 0, 1, 0, 3]>, #<User:0x007f9b4481eb88 @name="lev", @preferences=[0, 1, 2, 3, 0, 0, 0]>], nil], [[#<User:0x007f9b4481eb88 @name="lev", @preferences=[0, 1, 2, 3, 0, 0, 0]>, #<User:0x007f9b448b4c28 @name="zell", @preferences=[3, 0, 1, 0, 2, 0, 0]>], nil], [[#<User:0x007f9b4481d0f8 @name="josh", @preferences=[0, 0, 2, 0, 1, 3, 0]>, #<User:0x007f9b4481de68 @name="sar", @preferences=[2, 3, 0, 0, 1, 0, 0]>], nil], [[#<User:0x007f9b4481c068 @name="eli", @preferences=[2, 0, 0, 0, 1, 0, 3]>, #<User:0x007f9b4481de68 @name="sar", @preferences=[2, ...
#User.all_pairs.combination(7).to_a.map {|e| Schedule.score(e) }
