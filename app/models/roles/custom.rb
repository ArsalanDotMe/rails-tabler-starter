# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  name        :string
#  permissions :json             not null
#  type        :string
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  space_id    :integer
#
module Roles
  class Custom < Role
    belongs_to :space

    def self.sti_name
      CUSTOM_TYPE
    end
  end
end
