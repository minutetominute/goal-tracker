class Goal < ActiveRecord::Base
  after_initialize :ensure_privacy, :mark_as_incomplete

  belongs_to :author,
    class_name: "User"

  def ensure_privacy
    self.is_private ||= false
  end

  def mark_as_incomplete
    self.is_complete ||= false
  end
end
