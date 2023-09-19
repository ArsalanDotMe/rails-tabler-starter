# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  end_date   :datetime
#  integer    :integer
#  seats      :integer
#  start_date :datetime         not null
#  plan_id    :integer          not null
#  space_id   :integer          not null
#
class Subscription < ApplicationRecord
  belongs_to :space
  belongs_to :plan
end
