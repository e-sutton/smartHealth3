json.extract! prescription, :id, :firstname, :lastname, :cost, :doctorname, :medicine, :dose, :description, :patient_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
