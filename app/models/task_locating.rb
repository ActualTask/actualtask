class TaskLocating < ApplicationRecord
  belongs_to :task
  belongs_to :location

  accepts_nested_attributes_for :location
end
