module Stack4stack
  module States

    extend ActiveSupport::Concern

    STATUSES = ['open', 'closed', 'filled']

    included do
      after_initialize { self.status = STATUSES.first if self.status.blank? }
    end

    def open?
      self.status == 'open'
    end

    def closed?
      self.status != 'open'
    end

    def filled?
      self.status == STATUSES.last
    end

  end
end