nombres = %w[Violeta Andino Clemente Javiera Paula Pia Ray]

# Utilizando .map crear una arreglo con los nombres en minuscula.
arr1 = nombres.map(&:downcase)
print "#{arr1}\n"

# Utilizando .select para crear un arreglo con todos los nombres
# que empiecen con P.
arr2 = nombres.select { |val| val[0] == 'P' }
print "#{arr2}\n"

# Utilizando .map crear un arreglo unico con la cantidad de letras que
# tiene cada nombre.
arr3 = nombres.map(&:length)
print "#{arr3}\n"

# Utilizando .map y .gsub eliminar las vocales de todos los nombres.
arr4 = nombres.map { |val| val.gsub(/[aeiou]/, '') }
print "#{arr4}\n"
