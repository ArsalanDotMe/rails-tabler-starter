# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id       :integer          not null, primary key
#  role_id  :integer          not null
#  space_id :integer          not null
#  user_id  :integer          not null
#
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :space
  belongs_to :role

  validate :role_belongs_to_space

  private

  def role_belongs_to_space
    return if role.common?
    return if role.space == space

    errors.add(:base, 'invalid role for space')
  end
end
