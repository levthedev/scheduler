class Schedule
end

class User
  def initialize(name, preferences)
    @name = name
    @preferences = preferences
  end
end

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
