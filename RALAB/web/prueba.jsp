<html>
<head>
    <title>CARGANDO...</title>
    <script>
        function seleccionarJSP() {
            var opcion = prompt("SELECCIONA EL PROCEDIMIENTO A REGISTRAR:\n1. Ordinario\n2. Individual");

            // Redirigir al JSP seleccionado
            if (opcion === "1") {
                window.location.href = "Interfaz_Ordinario.jsp";
            } else if (opcion === "2") {
                window.location.href = "Interfaz_Individual.jsp";
            } else {
                alert("Opci�n inv�lida. Selecciona nuevamente.");
                seleccionarJSP(); // Si la opci�n es inv�lida, volver a solicitar la selecci�n
            }
        }
    </script>
</head>
<body onload="seleccionarJSP()">
<CENTER> <h1>CARGANDO...   ESPERE UN MOMENTO POR FAVOR</h1>
</body>
</html>