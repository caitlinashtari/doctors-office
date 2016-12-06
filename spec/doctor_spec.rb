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
end
