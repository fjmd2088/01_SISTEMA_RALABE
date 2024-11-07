document.addEventListener('DOMContentLoaded', function() {
    // Obtener el elemento donde se mostrará la fecha y la hora
    const currentDateTimeElement = document.getElementById('current-date');
    
    // Función para actualizar la fecha y la hora
    function actualizarFechaYHora() {
        const currentDate = new Date();

        // Opciones para formatear la fecha
        const dateOptions = { 
            weekday: 'long', 
            year: 'numeric', 
            month: 'long', 
            day: 'numeric' 
        };

        // Formato de la hora
        const timeOptions = {
            hour: 'numeric',
            minute: 'numeric',
            second: 'numeric',
            hour12: false  // Usa formato de 24 horas
        };

        // Concatenar la fecha y la hora en un solo string
        const fechaYHora = `${currentDate.toLocaleDateString('es-ES', dateOptions)} ${currentDate.toLocaleTimeString('es-ES', timeOptions)}`;
        
        // Actualizar el contenido del elemento con la fecha y la hora
        currentDateTimeElement.textContent = fechaYHora;
    }

    // Llamar a la función para mostrar la fecha y la hora actual inmediatamente
    actualizarFechaYHora();
    
    // Actualizar la hora cada segundo
    setInterval(actualizarFechaYHora, 1000);
});
