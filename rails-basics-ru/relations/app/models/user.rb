# frozen_string_literal: true

class User < ApplicationRecord
  # BEGIN
  has_many :tasks
  has_many :statuses, through: :tasks
  # END
end
