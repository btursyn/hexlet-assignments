# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_many :tasks
  has_many :users, through: :tasks
  # END
end
