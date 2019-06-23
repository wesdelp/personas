def build_persona(name)
  class_name = name.to_s.capitalize

  return if Personas.const_defined?(class_name)

  klass = Personas.const_set(
    name.to_s.capitalize,
    Class.new(Personas::Base)
  )

  klass.define_singleton_method(:applies?) do |_user|
    true
  end
end
