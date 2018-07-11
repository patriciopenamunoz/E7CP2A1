def registrar_nombre
  puts 'Ingrese el nombre de la persona en cuestión:'
  gets.chomp.capitalize
end

def registrar_edad
  puts 'Ingrese la edad de la persona:'
  gets.chomp.to_i
end

def registrar_comuna
  puts 'Ingrese la comuna de residencia de la persona:'
  gets.chomp.capitalize
end

def registrar_genero
  loop do
    puts 'Seleccione el género de la persona:'
    puts '-----'
    puts '1 => Masculino'
    puts '2 => Femenino'
    puts '3 => Otro'
    case gets.chomp.to_i
    when 1 then return 'Masculino'
    when 2 then return 'Femenino'
    when 3 then return 'otro'
    else puts 'La opción seleccionada no es válida'
    end
  end
end

def ingresar_persona(lista)
  # Opcion 1: Permite ingresar los datos de una persona:
  ## Nombre
  ## Edad
  ## Comuna
  ## Genero
  nombre = registrar_nombre
  edad = registrar_edad
  comuna = registrar_comuna
  genero = registrar_genero

  puts '#################################'
  puts 'PERSONA REGISTRADA - RESUMEN'
  puts "Nombre: #{nombre}"
  puts "Edad : #{edad}"
  puts "Comuna: #{comuna}"
  puts "Género: #{genero}"
  puts '#################################'

  lista.push Hash[
    nombre: nombre,
    edad: edad,
    comuna: comuna,
    genero: genero
  ]
end

def seleccionar_persona(lista, mensaje ='Seleccione una opción')
  if lista.length.zero?
    puts 'ERROR: No hay personas que seleccionar.'
    -1
  else
    loop do
      puts mensaje
      puts '0 => NINGUNO'
      lista.each_with_index { |v, i| puts "#{i + 1} => #{v[:nombre]}" }
      opt = gets.chomp.to_i
      return opt > 0 ? opt - 1 : -1 if opt >= 0 && opt <= lista.length
      puts 'La opción seleccionada no es válida'
    end
  end
end

def editar_persona(lista)
  # Opcion 2: Permite editar los datos de la persona.
  opt = seleccionar_persona(lista, 'Seleccione al usuario a editar:')
  if opt >= 0
    editar = true
    while editar
      puts '¿Qué desea editar de la persona seleccionada?'
      puts "1 => Nombre : #{lista[opt][:nombre]}"
      puts "2 => Edad : #{lista[opt][:edad]}"
      puts "3 => Comuna : #{lista[opt][:comuna]}"
      puts "4 => Genero : #{lista[opt][:genero]}"
      case gets.chomp.to_i
      when 1
        lista[opt][:nombre] = registrar_nombre
        editar = false
      when 2
        lista[opt][:edad] = registrar_edad
        editar = false
      when 3
        lista[opt][:comuna] = registrar_comuna
        editar = false
      when 4
        lista[opt][:genero] = registrar_genero
        editar = false
      else
        puts 'La opción seleccionada no es válida.'
      end
    end
    puts 'Persona editada'
  end
end

def eliminar_persona(lista)
  # Opcion 3: Permite eliminar una persona.
  opt = seleccionar_persona(lista, 'Seleccione al usuario a eliminar:')
  if opt >= 0
    eliminado = lista[opt][:nombre]
    lista.delete_at(opt)
    puts "'#{eliminado}' fue eliminado/a."
  end
end

def contar_personas(lista)
  # Opcion 4: Muestra la cantidad de personas ingresadas.
  puts "Hay #{lista.length} persona(s) registradas."
end

def listar_comunas(lista)
  # Opcion 5: Muestra las comunas de todas las personas.
  # hint: Generar un array con las comunas, eliminar repeticiones.
  # Considerar que pueden haber nombres escritos con mayuscula y minuscula.
  if lista.length.zero?
    puts 'No hay comunas registradas'
  else
    puts 'Listado de comunas:'
    lista.map { |v| v[:comuna] }.uniq.each { |v| puts "- #{v}" }
  end
end

def listar_edad_20_25(lista)
  # Opcion 6: Muestra una lista con todas las personas que tengan
  # entre 20 y 25 anos.
  if lista.length.zero?
    puts 'No hay personas registradas'
  else
    puts 'Listado de personas con edades entre 20 y 25 años.'
    lista.each { |v| p "- #{v[:nombre]}" if v[:edad].between?(20, 25) }
  end
end

def obtener_sumatorio_edades(lista)
  # Opcion 7: Muestra la suma de las edades de todas las personas.
  if lista.length.zero?
    puts 'No hay personas registradas'
  else
    sumatoria = lista.inject(0) { |sum, n| sum + n[:edad] }
    puts "El total de la sumatoria de edades es: #{sumatoria}."
  end
end

def obtener_promedio_edades(lista)
  # Opcion 8: Muestra el promedio de las edades del grupo.
  if lista.length.zero?
    puts 'No hay personas registradas'
  else
    promedio = lista.inject(0) { |sum, n| sum + n[:edad] } / lista.length
    puts "La media aritmetica de edades es: #{promedio}."
  end
end

def listar_personas_generos(lista)
  # Opcion 9: Muestra dos listas de personas, una por cada genero.
  if lista.length.zero?
    puts 'No hay personas registradas'
  else
    lista.group_by { |v| v[:genero] }.each do |key, value|
      puts ''
      puts key.to_s
      puts '#############'
      value.each { |per| puts "- #{per[:nombre]}" }
    end
  end
end

listado = []
# El menu debe repetirse hasta que el usuario ingrese la opcion 10 (salir).
salir = false

until salir
  puts '-------------'
  puts 'Seleccione una opción:'
  puts ''
  puts '1  => Ingresar una persona'
  puts '2  => Editar datos de una persona'
  puts '3  => Eliminar una persona'
  puts '4  => Consultar por la cantidad de personas'
  puts '5  => Ver listado de comunas'
  puts '6  => Ver listado de personas con edades de entre 20 y 25 años'
  puts '7  => Consultar por la sumatoria la edad de todas las personas'
  puts '8  => Consultar por el promedio de las edades'
  puts '9  => Obtener el listado de personas por género'
  puts '10 => SALIR'
  puts '-------------'

  case gets.chomp.to_i
  when 1 then ingresar_persona listado
  when 2 then editar_persona listado
  when 3 then eliminar_persona listado
  when 4 then contar_personas listado
  when 5 then listar_comunas listado
  when 6 then listar_edad_20_25 listado
  when 7 then obtener_sumatorio_edades listado
  when 8 then obtener_promedio_edades listado
  when 9 then listar_personas_generos listado
  when 10 then salir = true
  else puts 'La opción seleccionada no es válida'
  end

end
