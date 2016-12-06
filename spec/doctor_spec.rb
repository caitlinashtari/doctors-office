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
end
