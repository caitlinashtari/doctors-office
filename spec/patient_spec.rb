require('spec_helper')

describe(Patient) do
  describe("#initialize") do
    it('it tells you its name') do
      patient = Patient.new({:name => "Kenny", :birthday => '1988-06-29', :doctor_id => nil })
      expect(patient.name).to(eq("Kenny"))
      expect(patient.birthday).to(eq('1988-06-29'))
      expect(patient.doctor_id).to(eq(nil))
    end
  end
end
