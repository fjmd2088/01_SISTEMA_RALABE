/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author octavio.lozano
 */
public class Organo {
    String clave;
    String nombre;
    String sede;
    int entidad;   
    String colonia;
    String latitud;
    String longitud;
    int cirunscripcion;
    String otraC;
    int jurisdiccion;
    String horario;

    public Organo() {
    }

    public Organo(String clave, String nombre, String sede, int entidad, String colonia, String latitud, String longitud, int cirunscripcion, String otraC, int jurisdiccion, String horario) {
        this.clave = clave;
        this.nombre = nombre;
        this.sede = sede;
        this.entidad = entidad;
        this.colonia = colonia;
        this.latitud = latitud;
        this.longitud = longitud;
        this.cirunscripcion = cirunscripcion;
        this.otraC = otraC;
        this.jurisdiccion = jurisdiccion;
        this.horario = horario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public int getEntidad() {
        return entidad;
    }

    public void setEntidad(int entidad) {
        this.entidad = entidad;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public String getLatitud() {
        return latitud;
    }

    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public int getCirunscripcion() {
        return cirunscripcion;
    }

    public void setCirunscripcion(int cirunscripcion) {
        this.cirunscripcion = cirunscripcion;
    }

    public String getOtraC() {
        return otraC;
    }

    public void setOtraC(String otraC) {
        this.otraC = otraC;
    }

    public int getJurisdiccion() {
        return jurisdiccion;
    }

    public void setJurisdiccion(int jurisdiccion) {
        this.jurisdiccion = jurisdiccion;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }
    
    

   
    
    
          
    
}
