class Patient
  attr_reader(:name, :birthday, :doctor_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @doctor_id = attributes.fetch(:doctor_id)

  end
end
