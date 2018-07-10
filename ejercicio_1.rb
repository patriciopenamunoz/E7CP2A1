a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

# Utilizando map generar un nuevo arreglo con cada valor aumentado en 1.
arr1 = a.map { |val| val + 1 }
print "#{arr1}\n"

# Utilizando map generar un nuevo arreglo que contenga todos los valores
# convertidos a float.
arr2 = a.map(&:to_f)
print "#{arr2}\n"

# Utilizando map generar un nuevo arreglo que contenga todos los
# valores convertidos a string.
arr3 = a.map(&:to_s)
print "#{arr3}\n"

# Utilizando reject descartar todos los elementos menores a 5 en el array.
arr4 = a.reject { |val| val < 5 }
print "#{arr4}\n"

# Utilizando select descartar todos los elementos mayores a 5 en el array.
arr5 = a.select { |val| val < 5 }
print "#{arr5}\n"

# Utilizando inject obtener la suma de todos los elementos del array.
total = a.inject(0) { |num, val| num + val }
print "#{total}\n"

# Utilizando group_by agrupar todos los numeros por paridad
# (si son pares, es un grupos, si son impares es otro grupo).
arr6 = a.group_by { |i| (i % 2).zero? }.values
print "#{arr6}\n"

# Utilizando group_by agrupar todos los numeros mayores y menores que 6.
arr7 = a.group_by { |i| i != 6 }.values
print "#{arr7}\n"
