class Goal < ActiveRecord::Base
  after_initialize :ensure_privacy

  belongs_to :author,
    class_name: "User"

  def ensure_privacy
    self.is_private ||= false
  end
end
