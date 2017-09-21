class Task < ApplicationRecord


  validates :title, :body, presence: true

  mount_uploaders :attachments, AttachmentsUploader

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("tasks.created_at #{ direction }")
      when /^price_/
        # Simple sort on the name colums
        order("tasks.price #{ direction }")
      when /^time_end_/
        # This sorts by a student's country name, so we need to include
        # the country. We can't use JOIN since not all students might have
        # a country.
        order("task.time_end #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  def self.options_for_sorted_by
    [
        ['Price', 'price_asc'],
        ['Price_desc', 'price_desc'],
        ['Created add_desc (newest first)', 'created_at_desc'],
        ['Created add_asc (newest first)', 'created_at_asc'],
        ['Time_end', 'time_end_asc'],
        ['Time_end_desc', 'time_end_desc'],




    ]
  end


  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :with_price


      ]
  )



  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :user
  has_many :response_lists
  has_many :comments
  #has_many :pictures #files through attachments
  has_many :locations
  accepts_nested_attributes_for :locations
  belongs_to :user, inverse_of: :jobs
  has_many :reviews


  after_create { |task| Activity.create! action: "create", trackable: task}

  #accepts_nested_attributes_for :responses


  def perform(message)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: 'MESSAGE_HTML'
  end

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end




end