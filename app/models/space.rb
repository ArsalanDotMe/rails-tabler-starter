# frozen_string_literal: true

# == Schema Information
#
# Table name: spaces
#
#  id         :integer          not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  phone      :string
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Space < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  has_many :subscriptions
  has_many :plans, through: :subscriptions

  validates :name, presence: true

  after_create :create_subscription

  enum status: %i[active archived]

  def all_roles
    Role.where(space_id: [nil, id])
  end

  def active_subscription
    subscriptions.last
  end

  private

  def create_subscription
    Subscription.create(
      plan_id: 1,
      space_id: id,
      start_date: Time.zone.today,
    )
  end
end
