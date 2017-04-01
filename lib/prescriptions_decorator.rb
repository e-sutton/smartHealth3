# the basic prescription
class BasicPrescription
    def initialize(c, doctorname, medicine, dose)
        @cost = c
        @doctorname = doctorname
        @medicine = medicine
	@dose = dose
        @description = "basic prescription"
    end
    
    def cost 
        return @cost
    end
    
    # a method which returns a string 
    def details
        return @description + "; " + @doctorname + "; " + @medicine + ": " + "#{@cost}"
    end
    
    def medicine
        return @medicine
    end
    
    def doctorname 
        return @doctorname
    end

    def dose 
        return @dose
    end
    
end 


class PrescriptionDecorator < BasicPrescription
    def initialize(basic_prescription)
        @basic_prescription = basic_prescription
        super(@basic_prescription.cost, @basic_prescription.doctorname, @basic_prescription.medicine, @basic_prescription.dose)
        @extra_cost = 0
        @description = "no extra additions"
    end
    
    # override the cost method to include the cost of the extra medicine	
    def cost        
        return @extra_cost + @basic_prescription.cost
    end
    
    # override the details method to include the description of the extra medicine
    def details
        return  @description + ": " + "#{@extra_cost}" + ". " + @basic_prescription.details
    end
    
end 


# paracetamol
class ParacetamolDecorator < PrescriptionDecorator
    def initialize(basic_prescription)
        super(basic_prescription)
        @extra_cost = 10
        @description = "Paracetamol"
    end
    
end 

# ibuprofen 
class IbuprofenDecorator < PrescriptionDecorator
    def initialize(basic_prescription)
        super(basic_prescription)
        @extra_cost = 20
        @description = "Ibuprofen"
    end
    
end 


# Augmentin
class AugmentinDecorator < PrescriptionDecorator
    def initialize(basic_prescription)
        super(basic_prescription)
        @extra_cost = 150
        @description = "Augmentin Antibiotic"
    end
    
end 



