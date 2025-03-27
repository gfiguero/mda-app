module ApplicationHelper
  include IconsHelper
  include Pagy::Frontend

  # Flash Messages
  def notification_class(level)
    case level
    when :notice then "notification-notice"
    when :alert then "notification-alert"
    when :error then "notification-error"
    when :success then "notification-success"
    when :created then "notification-created"
    when :updated then "notification-updated"
    when :deleted then "notification-deleted"
    end
  end

  def sort_scope(column)
    "sort_by_#{column}"
  end

  def filter_scope(attribute)
    "filter_by_#{attribute}"
  end

  def sort_link(path, text, column)
    sort_column = params[:sort_column]
    sort_direction = params[:sort_direction]
    text ||= path
    return link_to raw(text + icon("chevron-up", "w-5 h-2")), send(path, request.params.merge(sort_column: column, sort_direction: "desc")), {class: "flex items-center"} if sort_column == column && sort_direction == "asc"
    return link_to raw(text + icon("chevron-down", "w-5 h-2")), send(path, request.params.merge(sort_column: column, sort_direction: "asc")), {class: "flex items-center"} if sort_column == column && sort_direction == "desc"
    link_to raw(text + icon("chevron-sort", "w-5 h-3")), send(path, request.params.merge(sort_column: column, sort_direction: "asc")), {class: "flex items-center"}
  end

  def notification_icon(notification_key)
    case notification_key
    when "notice" then icon("info-circle")
    when "alert" then icon("exclamation-circle")
    when "error" then icon("close-circle")
    when "success" then icon("check-circle")
    when "created" then icon("plus-circle")
    when "updated" then icon("edit")
    when "deleted" then icon("trash")
    else icon("info-circle")
    end
  end

  def icon_text(text)
    raw("<div class='ml-2''>" + text + "</div>")
  end

  def error_message(invalid, messages)
    if invalid
      errors = ""
      messages.each { |message| errors += "<div class='form-control-message'>" + message + "</div>" }
      errors
    end
  end

  def mini_token
    rand(36**8).to_s(36)
  end
end
