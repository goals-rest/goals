class DailyGoalsProgress
  include ActiveModel::Model

  attr_accessor :date, :updates, :user_id

  def self.where(**args)
    scope = base_scope
    scope = scope.where(**args) if args.size.positive?
    map_scope_to_models(scope)
  end

  private
  def self.base_scope
    Goal::ProgressChange
      .joins(goal: :user)
      .group(*group_by_columns)
  end

  def self.map_scope_to_models(scope)
    scope
      .pluck(*selected_columns)
      .map do |updates, date, user_id|
        new(date: date.to_date, updates:, user_id:)
      end
  end

  def self.group_by_columns
    [
      "DATE(goal_progress_changes.CREATED_AT, 'localtime')",
      :user_id
    ]
  end

  def self.selected_columns
    [
      Arel.sql("COUNT(*) AS updates"),
      Arel.sql("DATE(goal_progress_changes.CREATED_AT, 'localtime') AS date"),
      :user_id
    ]
  end
end
