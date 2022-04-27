# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron


every 1.day do
  runner "RewardJob.new.reward_for_dob"
  runner "RewardJob.new.reward_for_transactions"
end

every 1.year, :at => 'December 31th 11:59pm' do
  runner "RewardJob.new.expire_points"
end

every 3.months, :at => '11:59pm' do
  runner "RewardJob.new.bonus_points"
end