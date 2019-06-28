# frozen_string_literal: true

def build_persona(name)
  class_name = name.to_s.capitalize

  return if Personas.const_defined?(class_name)

  klass = Personas.const_set(
    class_name,
    Class.new(Personas::Base)
  )

  klass.define_singleton_method(:applies?) do |_user|
    true
  end
end
