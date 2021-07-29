json.graduations do
  json.array! @person.graduations, partial: "api/v1/graduations/graduation", as: :graduation
end
