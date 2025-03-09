module Profiles
  class FeedEntryPolicy < ProfilesPolicy
    def destroy?
      owner?
    end

    private
    def owner?
      record.owner_id == user&.id
    end
  end
end
