# frozen_string_literal: true

class EmployeeScaffold
  BASE_COMMAND_GENERATE = 'rails g scaffold'
  BASE_COMMAND_DESTROY = 'rails d scaffold'
  CLASS_NAME = 'Employee'
  #COMMAND_OPTIONS = '--skip-migration --force'
  COMMAND_OPTIONS = ''

  FIELDS = [
    'first_name:string',
    'last_name:string',
    'identification_number:string',
    'identification_code:string',
    'identification_type:string',
    'email:string',
  #'users:references',
  #'profiles:references',
  ].freeze

  def generate_command
    @command = "#{BASE_COMMAND_GENERATE} #{CLASS_NAME} #{FIELDS.join(' ')} #{COMMAND_OPTIONS}"
  end

  def destroy_command
    @command = "#{BASE_COMMAND_DESTROY} #{CLASS_NAME}"
  end

  # If you ever want to print or access the command outside the class:
  attr_reader :command
end