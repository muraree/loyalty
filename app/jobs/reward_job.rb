class RewardJob < ApplicationJob
  queue_as :default

  def perform(user)
    user = user
    points = Point.where(user_id: user.id, created_at: Time.now.beginning_of_month..Time.now.end_of_month)
    total_score = points.pluck(:score).sum

    if total_score >= 100
      UserReward.create(user_id: user.id, reward_id: Reward.first.id)
    end

    if user.points == 1000
      user.update_attribute(:tier, "gold")
      UserReward.create(user_id: user.id, reward_id: Reward.last.id)
    elsif (user.points == 5000 )
      user.update_attribute(:tier, "platinum")
    end
  end


  def reward_for_dob
    users = User.where(dob: Time.now.beginning_of_month..Time.now.end_of_month)
    users.find_each do |user|
      UserReward.create(user_id: user.id, reward_id: Reward.second.id)
    end
  end

  def reward_for_transactions
    users = User.joins(:bills).group('users.id').having('count(bills.id) >= 10')
    user.find_each do |user|
      total = Bill.where(user_id: user.id).pluck(:amount).sum
      if total >= 100
        UserReward.create(user_id: user.id, reward_id: Reward.fourth.id)
      end
    end
  end

  def expire_points
    Point.destroy_all
  end

  def bonus_points
    users = User.joins(:bills).where("bills.amount > ? ", 2000)
    users.find_each do |user|
      user.update_attribute(:points, user.points + 100)
    end
  end
end
