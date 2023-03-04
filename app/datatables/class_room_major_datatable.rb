class ClassRoomMajorDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      name:       { source: "ClassRoom.name", cond: :like, searchable: true, orderable: true },
      short:      { source: "ClassRoomMajor.short", cond: :like, searchable: true, orderable: true },
      created_at: { source: "ClassRoomMajor.created_at", cond: :like, searchable: true, orderable: true },
      updated_at: { source: "ClassRoomMajor.updated_at", cond: :like, searchable: true, orderable: true },
      DT_RowId: { cond: :null_value, searchable: false, orderable: false },
      DT_actions: { source: "ClassRoomMajorDecorator.DT_actions", cond: :null_value, searchable: false, orderable: false}
    }
  end

  def data
    records.map do |record|
      {
        name:       record.name,
        short:      record.short,
        created_at: record.decorate.created_at,
        updated_at: record.decorate.updated_at,
        DT_RowId:   record.id,
        DT_actions: record.decorate.DT_actions
      }
    end
  end

  def get_raw_records
    ClassRoomMajor.joins(:major).select(
      :'class_room_majors.id', :'class_room_majors.name', :'majors.short', 
      :'class_room_majors.created_at', :'class_room_majors.updated_at', :'class_room_majors.class_room_id').where('class_room_majors.class_room_id = ?', self.params[:class_room_id])
  end
end
