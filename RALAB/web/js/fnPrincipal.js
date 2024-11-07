
$(document).ready(function () {
  
//////////////////////////OBTIENE LOS VALORES DE LA ENTIDAD Y MUNICIPIO/////////////////////////////
    $('#E').change(function () {
        var enti = $('#E').val();

        $.ajax({
            type: 'post',
            url: 'ObtenMunicipios',
            data: {
                enti: enti
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                $('#M').html(response);
                console.log('response');
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });   
  //////////////////////////////////////////OBTENER EL VALOR DE LA CIRCUNSCRIPCION///////////////////////////  
    function obtenerCircunscripcion() {
  var  circunscripcion = $('#C').val();

  $.ajax({
    type: "POST",
    url: 'Guarda_organo',
    data: { circunscripcion: circunscripcion },
    success: function (response) {
      // Procesar la respuesta del servlet
      console.log("Respuesta del servlet:", response);
    },
    error: function (response) {
      console.error("Error al enviar el valor al servlet:", response);
    }
  });
}
});
/////////HABILITA LA CAJA DE TEXTO PARA ESPECIFIQUE//////////////////////
  function habilitar() {
  var valorSeleccionado = document.getElementById("C").value;

  if (valorSeleccionado === "Otra circunscripción (especifique)") {
    document.getElementById("OtraCir").disabled = false;
  } else {
    document.getElementById("OtraCir").disabled = true;
  }
}

function funcionLatitud(input)
{
    var  lat = parseFloat(document.getElementById("latitud").value);
    const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
        Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
       
        input.value = '';
    }
    else
    {
         if ( lat < 11 || lat > 33)
        {
             Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de 11 a 33 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
            
            document.getElementById("latitud").value = "";
        }
    }   
}

function funcionLongitud(input)
{
    var  lon = parseFloat(document.getElementById("longitud").value);
    const regex = /^-?\d+(\.\d{1,10})?$/;
    if(!regex.test(input.value))
    {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Ingrese solo números, con máximo 10 decimales',
            confirmButtonText: 'Aceptar'
        });
        input.value = '';
    }
    else
    {
         if ( lon < -123 || lon > -83)
         {
              Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'La latitud debe estar en un rango de -123 a -83 con un máximo de 10 decimales',
            confirmButtonText: 'Aceptar'
        });
             
              document.getElementById("longitud").value = "";
         }
    }   
}

////////////////////////////////////////////////////
function compararHoras()
{
    const hora1Input = document.getElementById('horario1');
    const hora2Input = document.getElementById('horario2');

    const hora1 = new Date(`1970-01-01T${hora1Input.value}`);
    const hora2 = new Date(`1970-01-01T${hora2Input.value}`);

    if (hora1 > hora2) {
      alert("La hora 1 es mayor que la hora 2");
    } else if (hora1 < hora2) {
      alert("La hora 2 es mayor que la hora 1");
    } else {
      alert("Las horas son iguales");
    }
  }
/////////////////////////////////////////////////////////////
function validarNumeroPositivo(input) {
  if (input.value < 0) {
    alert("Por favor, ingrese un número positivo.");
    input.value = ""; // Limpiar el campo si se ingresa un valor negativo
  }
}

function validarCampo(campo) {
    // Expresión regular para permitir solo letras mayúsculas sin acentos
    const regex = /^[A-Z\s]*$/;

    // Elimina cualquier carácter que no coincida con la expresión regular
    campo.value = campo.value.replace(/[^A-Z]/g, '');
}

function validarNumero(input) {
  const regex = /^-?\d+(\.\d+)?$/;
  if (!regex.test(input.value)) {
    // Si el valor no coincide con la expresión regular, puedes:
    // - Mostrar un mensaje de error
    // - Limpiar el valor del input
    // - Impedir que se escriban más caracteres
    input.value = input.value.slice(0, -1); // Elimina el último carácter
  }
}

function validarYConvertirTextNum(input) {
  const regex = /^[A-Z0-9 ]+$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, escriba sólo texto sin acentos',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      const textoMayusculas = input.toUpperCase();
      return regex.test(textoMayusculas) ? textoMayusculas : "Texto inválido";
  }
}

function validarYConvertir(input) {
  const regex = /^[A-Z ]+$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, escriba sólo texto sin acentos',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      const textoMayusculas = input.toUpperCase();
      return regex.test(textoMayusculas) ? textoMayusculas : "Texto inválido";
  }
}

function validarYConvertirEspacioComa(input) {
  const regex = /^[A-Z]+( [A-Z]+)*(,[A-Z]+( [A-Z]+)*)*$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, escriba sólo texto sin acentos',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      const textoMayusculas = input.toUpperCase();
      return regex.test(textoMayusculas) ? textoMayusculas : "Texto inválido";
  }
}

function validarYConvertirSEDE(input) {
  const regex = /^[A-Z ,]*$/; // Permite solo letras mayúsculas y espacios
  input.value = input.value.toUpperCase();
  if (!regex.test(input.value)) 
  {
         Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'Por favor, escriba sólo texto sin acentos',
            confirmButtonText: 'Aceptar'
        });
        input.value = input.value.slice(0, -1);
  } 
  else 
  {    
      const textoMayusculas = input.toUpperCase();
      return regex.test(textoMayusculas) ? textoMayusculas : "Texto inválido";
  }
}

function mostrarAlerta(mensaje) {
    Swal.fire(mensaje);
   // alert(mensaje);
}
function confirmarGuardar() {
    // Enviar el formulario de forma asíncrona (opcional, para evitar recarga completa)
    // ...

    // Simular la respuesta del Servlet (reemplazar con una llamada AJAX real)
    var respuestaServlet ; // Ajustar según la respuesta real

    if (respuestaServlet === "Registro exitoso") {
        mostrarAlerta("¡Registro guardado correctamente!");
        return true; // Permitir el envío del formulario
    } else {
        mostrarAlerta("Error al guardar el registro. Por favor, intenta nuevamente.");
        return false; // Cancelar el envío del formulario
    }
}

 function mostrarFechaHora() {
           const fecha = new Date();
            const campoTexto = document.getElementById("campoFechaHora");
            campoTexto.value = fecha.toLocaleString();
        }
      
        setInterval(mostrarFechaHora,1000)
   
// Ejecutar la función al cargar la página y cada segundo
