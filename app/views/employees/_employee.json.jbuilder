json.extract! employee, :id, :first_name, :last_name, :identification_number, :identification_code, :identification_type, :email_address, :created_at, :updated_at
json.url employee_url(employee, format: :json)
