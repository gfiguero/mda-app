# frozen_string_literal: true

class InspectionScaffold
  BASE_COMMAND_GENERATE = "rails g scaffold"
  BASE_COMMAND_DESTROY = "rails d scaffold"
  CLASS_NAME = "Inspection"
  # COMMAND_OPTIONS = '--skip-migration --force'
  COMMAND_OPTIONS = ""

  FIELDS = [
    "name:string",
    "start_time:datetime",
    "end_time:datetime",
    "date:datetime",
    "week_number:integer",
    "found:boolean",
    "comment:text"
    # 'users:references',
    # 'profiles:references',
  ].freeze

  def generate_command
    @command = "#{BASE_COMMAND_GENERATE} #{CLASS_NAME} #{FIELDS.join(" ")} #{COMMAND_OPTIONS}"
  end

  def destroy_command
    @command = "#{BASE_COMMAND_DESTROY} #{CLASS_NAME}"
  end

  # If you ever want to print or access the command outside the class:
  attr_reader :command
end
