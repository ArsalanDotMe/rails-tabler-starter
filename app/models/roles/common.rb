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
  class Common < Role
    def self.sti_name
      COMMON_TYPE
    end
  end
end
