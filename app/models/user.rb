# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true

  DEFAULT_CREDITS = 10
end
