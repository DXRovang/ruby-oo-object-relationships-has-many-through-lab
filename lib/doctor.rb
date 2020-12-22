require "pry"

class Doctor

  @@all = []

  attr_accessor :name, :appointments, :patients

  def initialize(name)
    @name=name
    @@all << self

  end

  def self.all
    @@all
  end

  def new_appointment(date, patient_instance)
    Appointment.new(date, patient_instance, self)
  end

  def appointments
    Appointment.all.select do |app|
      app.doctor == self
    end
  end

  def patients
    appointments.map do |app|
      #need a patient_instance?
      app.patient
    end
  end

end
