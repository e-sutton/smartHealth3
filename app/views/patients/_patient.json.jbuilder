json.extract! patient, :id, :firstname, :lastname, :dob, :address, :phone, :injury, :observations, :doctor, :created_at, :updated_at
json.url patient_url(patient, format: :json)
