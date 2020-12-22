class Patient

  @@all = []

  attr_accessor :name, :appointments, :doctors

  def initialize(name)
    @name=name
    @@all << self

  end

  def self.all
    @@all
  end

  def new_appointment(date, doctor_instance)
    Appointment.new(date, self, doctor_instance)
  end

  def appointments
    Appointment.all.select do |app|
      app.patient == self
    end
  end

  def doctors
    appointments.map do |app|
      app.doctor
    end
  end

end