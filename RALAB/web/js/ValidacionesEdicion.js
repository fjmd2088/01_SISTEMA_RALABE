
   // Arreglo con las opciones que deben estar marcadas
                              const opcionesMarcadas = ['Aviso a un órgano jurisdiccional para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón', 'Aviso a una autoridad administrativa para que notifique el derecho preferente de los trabajadores frente al remate o adjudicación de los bienes embargados al patrón'];

        //                  Obtener todos los checkbox del grupo
                             const checkboxs = document.querySelectorAll('input[name="motivos_PC"]');

                             // Marcar los checkboxes que están en el arreglo
                              checkboxs.forEach((checkbox) => {
                              if (opcionesMarcadas.includes(checkbox.value)) {
                                    checkbox.checked = true;
                            }
                            });
