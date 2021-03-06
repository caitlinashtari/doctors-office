require('spec_helper')

describe(Doctor) do
  describe("#initialize") do
    it('tells you its name, specialty, and id') do
      doctor = Doctor.new({:name => "Dr. Who", :specialty => "cardiology", :id => nil})
      expect(doctor.name).to(eq("Dr. Who"))
      expect(doctor.specialty).to(eq("cardiology"))
      expect(doctor.id).to(eq(nil))
    end
  end

  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('lets you save doctors to the database') do
      doctor = Doctor.new({:name => "Dr. Who", :specialty => "cardiology", :id => nil})
      doctor.save
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe("#==") do
    it("is the same doctor if it has the same name") do
      doctor = Doctor.new({:name => "Dr. Who", :specialty => "cardiology", :id => nil})
      doctor2 = Doctor.new({:name => "Dr. Who", :specialty => "cardiology", :id => nil})
      expect(doctor).to(eq(doctor2))
    end
  end

  describe(".find") do
    it("returns a doctor by its ID") do
      doctor = Doctor.new({:name => "Dr. Who", :specialty => "cardiology", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Dr. Smith", :specialty => "pediatrics", :id => nil})
      doctor2.save()
      expect(Doctor.find(doctor2.id())).to(eq(doctor2))
    end
  end

  describe("#patients") do
    it("returns an array of patients for that doctor") do
      doctor = Doctor.new({:name => "Dr. Smith", :specialty => "pediatrics", :id => nil})
      doctor.save()
      new_patient = Patient.new({:name => "Kenny", :birthday => "1988-06-19", :doctor_id => doctor.id()})
      new_patient.save()
      new_patient2 = Patient.new({:name => "Sarah", :birthday => "1988-06-19", :doctor_id => doctor.id()})
      new_patient2.save()
      expect(doctor.patients()).to(eq([new_patient, new_patient2]))
    end
  end
end
