json.array! @employees do |employee|
  json.value employee.id
  json.text employee.name
end
