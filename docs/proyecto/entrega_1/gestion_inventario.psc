Algoritmo GestionInventario
	// ========================================================================
	// 1. DEFINICIÓN DE VARIABLES (Compatibilidad Base 1 Completamente Limpia)
	// ========================================================================
	Definir v_opcion, v_total, i, v_cantidad_aux Como Entero
	Definir v_codigo_aux, v_nombre_aux Como Caracter
	Definir v_precio_aux Como Real
	Definir v_existe Como Logico
	
	// Arreglos para la "Base de Datos" (Tamaño 100)
	Dimension lista_codigos[100]
	Dimension lista_nombres[100]
	Dimension lista_cantidades[100]
	Dimension lista_precios[100]
	
	v_total <- 0 
	v_opcion <- 0
	
	// ========================================================================
	// 2. CICLO PRINCIPAL
	// ========================================================================
	Mientras v_opcion = 0 O v_opcion = 1 O v_opcion = 2 Hacer
		Escribir ""
		Escribir "=== SISTEMA DE GESTION DE INVENTARIO ==="
		Escribir "1. Registrar Nuevo Producto"
		Escribir "2. Mostrar Inventario Actual"
		Escribir "3. Salir del Sistema"
		Escribir "Seleccione una opcion (1-3):"
		Leer v_opcion
		
		// ---------------------------------------------------------
		// OPCIÓN 1: REGISTRO CON VALIDACIONES
		// ---------------------------------------------------------
		Si v_opcion = 1 Entonces
			Si v_total >= 100 Entonces
				Escribir "Error: Almacen lleno (Capacidad maxima 100)."
			SiNo
				Escribir "Ingrese el codigo unico del producto:"
				Leer v_codigo_aux
				
				v_existe <- Falso
				
				// Solo busca duplicados si el total es mayor a 0
				Si v_total > 0 Entonces
					Para i <- 1 Hasta v_total Hacer
						Si lista_codigos[i] = v_codigo_aux Entonces
							v_existe <- Verdadero
						FinSi
					FinPara
				FinSi
				
				Si v_existe = Verdadero Entonces
					Escribir "Error: El codigo ya existe en el sistema."
				SiNo
					Escribir "Ingrese el nombre del producto:"
					Leer v_nombre_aux
					
					// Validar stock no negativo
					v_cantidad_aux <- -1
					Mientras v_cantidad_aux < 0 Hacer
						Escribir "Ingrese cantidad inicial (0 o mas):"
						Leer v_cantidad_aux
						Si v_cantidad_aux < 0 Entonces
							Escribir "La cantidad no puede ser negativa."
						FinSi
					FinMientras
					
					// Validar precio no negativo
					v_precio_aux <- -1.0
					Mientras v_precio_aux < 0 Hacer
						Escribir "Ingrese precio unitario:"
						Leer v_precio_aux
						Si v_precio_aux < 0 Entonces
							Escribir "El precio no puede ser negativo."
						FinSi
					FinMientras
					
					// Incrementamos el puntero para guardar de 1 a 100
					v_total <- v_total + 1
					
					// Persistencia segura en base 1
					lista_codigos[v_total] <- v_codigo_aux
					lista_nombres[v_total] <- v_nombre_aux
					lista_cantidades[v_total] <- v_cantidad_aux
					lista_precios[v_total] <- v_precio_aux
					
					Escribir "[!] Producto registrado exitosamente en la posicion: ", v_total
				FinSi
			FinSi
			v_opcion <- 0 
		FinSi
		
		// ---------------------------------------------------------
		// OPCIÓN 2: LECTURA DE DATOS
		// ---------------------------------------------------------
		Si v_opcion = 2 Entonces
			Si v_total = 0 Entonces
				Escribir "El inventario esta vacio."
			SiNo
				Escribir "CODIGO | NOMBRE | STOCK | PRECIO"
				Escribir "---------------------------------------"
				Para i <- 1 Hasta v_total Hacer
					Escribir lista_codigos[i], " | ", lista_nombres[i], " | ", lista_cantidades[i], " | $", lista_precios[i]
				FinPara
			FinSi
			v_opcion <- 0 
		FinSi
		
	FinMientras
	
	Escribir "Cerrando sistema..."
FinAlgoritmo