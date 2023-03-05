class StudentDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name:       { source: "Student.name", cond: :like, searchable: true, orderable: true },
      nisn:       { source: "Student.nisn", cond: :like, searchable: true, orderable: true },
      nis:        { source: "Student.nis", cond: :like, searchable: true, orderable: true },
      years:      { source: "Generation.years", cond: :like, searchable: true, orderable: true },
      class_room:      { source: "ClassRoomMajor.name", cond: :like, searchable: true, orderable: true },
      major:      { source: "Major.short", cond: :like, searchable: true, orderable: true },
      status:     { source: "Student.status", cond: :like, searchable: true, orderable: true },
      DT_RowId:   { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "StudentDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        nisn:       record.nisn,
        nis:        record.nis,
        years:      record.years,
        class_room: record.class_room,
        major:      record.short,
        status:     record.status,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    Student.select(
      :'students.name', :'students.nisn', :'students.nis', :'students.id', :'students.status',
      :'generations.years', "class_room_majors.name as class_room", :'majors.short').joins(:generation, class_room_major: :major)
  end

end
