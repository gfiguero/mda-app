module ApplicationHelper
  include Pagy::Frontend

  def icon_text(text)
    raw(text)
  end

  def icon(icon_collection, icon)
    raw('<i class="' + icon_collection + ' ' + icon + '"></i>')
  end

  def text_icon(text, icon, icon_collection = 'fa-solid')
    raw(icon(icon_collection, icon) + " " + text)
  end

  def error_message(invalid, messages)
    if invalid
      errors = ''
      messages.each { |message| errors += '<div class="invalid-feedback">' + message + '</div>' }
      return errors
    end
  end

  def sort_link(path, text, column)
    sort_column = params[:sort_column]
    sort_direction = params[:sort_direction]
    text ||= path
    return link_to raw(text + icon('sort-up', 'font-awesome')), send(path, request.params.merge(sort_column: column, sort_direction: 'desc' )), { class: 'flex items-center'} if sort_column == column and sort_direction == 'asc'
    return link_to raw(text + icon('sort-down', 'font-awesome')), send(path, request.params.merge( sort_column: column, sort_direction: 'asc' )), { class: 'flex items-center'} if sort_column == column and sort_direction == 'desc'
    link_to raw(text + icon('sort', 'font-awesome')), send(path, request.params.merge( sort_column: column, sort_direction: 'asc' )), { class: 'flex items-center'}
  end
end
