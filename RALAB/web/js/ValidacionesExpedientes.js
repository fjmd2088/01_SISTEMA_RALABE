function sumarValores() {
    let jih = parseInt(document.getElementById("jih").value) || 0;
    let jch = parseInt(document.getElementById("jch").value) || 0;
    let jmh = parseInt(document.getElementById("jmh").value) || 0;

    let jim = parseInt(document.getElementById("jim").value) || 0;
    let jcm = parseInt(document.getElementById("jcm").value) || 0;
    let jmm = parseInt(document.getElementById("jmm").value) || 0;

    let subH = jih + jch + jmh;
    let subM = jim + jcm + jmm;
    let tot = subH + subM;

    document.getElementById("sjh").value = subH;
    document.getElementById("sjm").value = subM;
    document.getElementById("tj").value = tot;
}

            
             function sumarExpedientes()
            {
                 let num1 = parseInt(document.getElementById('ord').value);
                 let num2 = parseInt(document.getElementById('ind').value);
                  let num3 = parseInt(document.getElementById('col').value);
                 let num4 = parseInt(document.getElementById('huelga').value);
                  let num5 = parseInt(document.getElementById('cne').value);
                 let num6 = parseInt(document.getElementById('pv').value);
                  let num7 = parseInt(document.getElementById('ter').value);
                 let num8 = parseInt(document.getElementById('cred').value);
                  let num9 = parseInt(document.getElementById('eje').value);
           
                 
 
                 let resultado=0;
                 
                 if(num1>=0)
                      resultado+=num1;
                if(num2>=0)
                      resultado+=num2;
                if(num3>=0)
                      resultado+=num3;
                if(num4>=0)
                      resultado+=num4;
                if(num5>=0)
                      resultado+=num5;
                if(num6>=0)
                      resultado+=num6;
                if(num7>=0)
                      resultado+=num7;
                if(num8>=0)
                      resultado+=num8;
                if(num9>=0)
                      resultado+=num9            


                 document.getElementById('totalExp').value = resultado;
            }
            function funcionNeg1()
            {
                var  lat = parseFloat(document.getElementById("ord").value);
                 
            
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ord").value = "";
                  }
            }
             function funcionNeg2()
            {
                var  lat = parseFloat(document.getElementById("ind").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ind").value = "";
                  }
            }
             function funcionNeg3()
            {
                var  lat = parseFloat(document.getElementById("col").value);
    
                   if ( lat < -2)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("col").value = "";
                  }
            }
             function funcionNeg4()
            {
                var  lat = parseFloat(document.getElementById("huelga").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("huelga").value = "";
                  }
            }
             function funcionNeg5()
            {
                var  lat = parseFloat(document.getElementById("cne").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("cne").value = "";
                  }
            }
             function funcionNeg6()
            {
                var  lat = parseFloat(document.getElementById("pv").value);
    
                   if ( lat < -2)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("pv").value = "";
                  }
            }
             function funcionNeg7()
            {
                var  lat = parseFloat(document.getElementById("ter").value);
    
                  if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ter").value = "";
                  }
            }
             function funcionNeg8()
            {
                var  lat = parseFloat(document.getElementById("cred").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("cred").value = "";
                  }
            }
             function funcionNeg9()
            {
                var  lat = parseFloat(document.getElementById("eje").value);
    
                   if ( lat < -2)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("ord").value = "";
                  }
            }
            
            /////////////////////////
             function funcionNegA()
            {
                var  lat = parseFloat(document.getElementById("jih").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jih").value = "";
                  }
            }
             function funcionNegB()
            {
                var  lat = parseFloat(document.getElementById("jim").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jim").value = "";
                  }
            }
             function funcionNegC()
            {
                var  lat = parseFloat(document.getElementById("jch").value);
    
                  if ( lat < 0)
                  {
                      Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jch").value = "";
                  }
            }
             function funcionNegD()
            {
                var  lat = parseFloat(document.getElementById("jcm").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jcm").value = "";
                  }
            }
             function funcionNegE()
            {
                var  lat = parseFloat(document.getElementById("jmh").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                      document.getElementById("jmh").value = "";
                  }
            }
             function funcionNegF()
            {
                var  lat = parseFloat(document.getElementById("jmm").value);
    
                  if ( lat < 0)
                  {
                       Swal.fire({
            icon: 'warning',
            title: '¡Atención!',
            text: 'No se admiten numeros negativos',
            confirmButtonText: 'Aceptar'
        });
                     // alert("No se admiten numeros negativo");
                      document.getElementById("jmm").value = "";
                  }
            }
            
            function validarEntero(input) 
            {
                const valor = input.value;
                if (!/^-?\d+$/.test(valor)) 
               {
                      input.value = valor.slice(0, -1); // Elimina el último carácter no válido
                }
            }
            
        // Función para abrir la ventana modal
        function openModal() {
            document.getElementById('myModal').style.display = 'block';
        }

        // Función para cerrar la ventana modal
        function closeModal() {
            document.getElementById('myModal').style.display = 'none';
        }

        // Cerrar el modal si se hace clic fuera del contenido
        window.onclick = function(event) {
            if (event.target === document.getElementById('myModal')) {
                closeModal();
            }
        };
            
 function validarPositivoNA(input) {
    // Convierte el valor ingresado a mayúsculas
    let valor = input.value.toUpperCase();

    // Actualiza el valor en el input para que se muestre en mayúsculas
    input.value = valor;

    // Permite NA progresivamente o números enteros
    if (!/^(NA?|[0-9]+)?$/.test(valor)) {
        input.value = valor.slice(0, -1); // Elimina el último carácter no válido
    }
}   