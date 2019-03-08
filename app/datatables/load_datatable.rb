class LoadDatatable < AjaxDatatablesRails::ActiveRecord
  def user
    @user ||= options[:user]
  end

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      date: { source: "Load.date", cond: :like },
      bullet: { source: "Bullet.name_grain_caliber", cond: :like },
      powder: { source: "Powder.name", cond: :like },
      powder_weight: { source: "Load.powder_weight", cond: :like },
    }
  end

  def data
    records.map do |record|
      {
        date: record.date,
        bullet: record.bullet.name_grain_caliber,
        powder: record.powder.name,
        powder_weight: record.powder_weight
      }
    end
  end

  def get_raw_records
    Load.by_user(user)
  end

end
