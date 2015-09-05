class Calender
  def self.potential_days
    %w[Su Mo Tu We Th Fr Sa].product(User.all_pairs)
  end

  def self.potential_schedules
    possibilities = []                                            # => []
    1000.times { |n| possibilities << User.all_pairs.sample(7) }  # => 1000
    possibilities.zip(possibilities.map(&:score))
  end

  def self.rate_potential_schedules
    schedule_score = {}
    potential_schedules.each do |schedule|
      schedule_score[schedule] = schedule.score
    end
    schedule_score
  end
end

class User
  attr_accessor :preferences,  # => :preferences
                :name          # => nil

  @@users_collection = []  # => []

  def initialize(name, preferences)
    @name = name                     # => "lev", "sar", "josh", "eli", "zell", "emily"
    @preferences = preferences       # => [1], [1], [1], [1], [1], [1]
    @@users_collection << self       # => [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @prefer...
  end

  def self.all
    @@users_collection  # => [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #...
  end

  def self.all_pairs
    pairs = []                                                             # => [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [], [...
    all.each do |user|                                                     # => [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:...
      all.length.times do |num|                                            # => 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
      pairs << [user, all[num]]                                            # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>]], [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>]], [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>]], [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>...
      end                                                                  # => 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, ...
    end                                                                    # => [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>, #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:...
    unique_pairs = pairs.map { |pair| pair.sort_by { |user| user.name } }  # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], ...
    .uniq                                                                  # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>],...
    .reject { |pair| pair if pair[0] == pair[1] }                          # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>]...
    unique_pairs                                                           # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>]...
  end
end

class Array
  def score
    each_with_index do |pair, index|
      score = 0                          # => 0
      pair.each do |user|                # => [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>]
        case [count].preferences[index]  # ~> NoMethodError: undefined method `preferences' for [7]:Array
        when 1 then score += 5
        when 2 then score += 3
        when 3 then score += 1
        when nil then score -= 1
        end
        count += 1
      end
    end
  end
end



User.new("lev", [1])    # => #<User:0x007fbd02025000 @name="lev", @preferences=[1]>
User.new("sar", [1])    # => #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>
User.new("josh", [1])   # => #<User:0x007fbd020240d8 @name="josh", @preferences=[1]>
User.new("eli", [1])    # => #<User:0x007fbd010c1208 @name="eli", @preferences=[1]>
User.new("zell", [1])   # => #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>
User.new("emily", [1])  # => #<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>

User.all_pairs  # => [[#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd02025000 @name="lev", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>, #<User:0x007fbd02025000 @name="lev", @preferences=[1]>], [#<User:0x007fbd020240d8 @name="josh", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd010c1208 @name="eli", @preferences=[1]>, #<User:0x007fbd020247e0 @name="sar", @preferences=[1]>], [#<User:0x007fbd020247e0 @name="sar", @preferences=[1]>, #<User:0x007fbd010b8c70 @name="zell", @preferences=[1]>], [#<User:0x007fbd010ab5e8 @name="emily", @preferences=[1]>...

Calender.potential_schedules
#Calender.rate_potential_schedules  # => {["Su", [#<User:0x007fd08c023c08 @name="lev", @preferences=[1]>, #<User:0x007fd08c0232f8 @name="sar", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c022b00 @name="josh", @preferences=[1]>, #<User:0x007fd08c023c08 @name="lev", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c022268 @name="eli", @preferences=[1]>, #<User:0x007fd08c023c08 @name="lev", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c023c08 @name="lev", @preferences=[1]>, #<User:0x007fd08c021908 @name="zell", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c020df0 @name="emily", @preferences=[1]>, #<User:0x007fd08c023c08 @name="lev", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c022b00 @name="josh", @preferences=[1]>, #<User:0x007fd08c0232f8 @name="sar", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c022268 @name="eli", @preferences=[1]>, #<User:0x007fd08c0232f8 @name="sar", @preferences=[1]>]]=>nil, ["Su", [#<User:0x007fd08c0232f8 @name="sar", @preferences=[1]>...


# Iteration 1
# output
# please enter all people you'd like on this week's schedule, with their preferences for each day.
# ex - [["adam sandler", [1, 0, 2, 3, 0]], ["jonah hill", [0, 1, 3, 2, 0]]]

# input
# [["sarah", [2,3,0,0,1]], ["lev", [1,0,0,2,3]]]
#________________________________________________
# Iteration 2
# output
# is sarah a noob? (Y/N)
# is sarah okay to work on Shabbat? (Y/N)

# input
# no
# yes

# this is repeated for all users
#_________________________________________________
# Iteration 1
# final output
# okay, here's your schedule:
# Mo  |  Tu  |  We  |  Th  |  Fr  |  Sa  |  Su
# sar |  lev | lev  | sar  | sar  | lev  | lev

# ~> NoMethodError
# ~> undefined method `preferences' for [7]:Array
# ~>
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:56:in `block (2 levels) in score'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:55:in `each'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:55:in `block in score'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:53:in `each'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:53:in `each_with_index'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:53:in `score'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:9:in `map'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:9:in `potential_schedules'
# ~> /Users/levkravinsky/Desktop/scheduler/schedule.rb:79:in `<main>'
