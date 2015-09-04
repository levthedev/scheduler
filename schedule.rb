class Calender
  def self.potential_schedules
    p %w[Su Mo Tu We Th Fr Sa].product(User.all_pairs)
  end

  # def days
  #   {"Su" => [], "Mo" => [], "Tu" => [], "We" => [], "Th" => [], "Fr" => [], "Sa" => []}
  # end

  def self.rate_potential_schedules
    schedule_score = {}
    potential_schedules.each do |schedule|
      schedule_score[scedule] = schedule.score
    end
  end
end

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

end

User.new("lev", [1])
User.new("sar", [1])
User.new("josh", [1])
User.new("eli", [1])
User.new("zell", [1])
User.new("emily", [1])

User.all_pairs

Calender.potential_schedules

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
