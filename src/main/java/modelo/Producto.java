package modelo;

import java.util.Date;

public class Producto {
    private int id;
    private String nombre;
    private double precio;
    private Categoria categoria;
    private Date fechaElaboracion;
    private boolean estado;

    public Producto() {}

    // Getters y Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public double getPrecio() { return precio; }
    public void setPrecio(double precio) { this.precio = precio; }
    public Categoria getCategoria() { return categoria; }
    public void setCategoria(Categoria categoria) { this.categoria = categoria; }
    public Date getFechaElaboracion() { return fechaElaboracion; }
    public void setFechaElaboracion(Date fechaElaboracion) { this.fechaElaboracion = fechaElaboracion; }
    public boolean isEstado() { return estado; }
    public void setEstado(boolean estado) { this.estado = estado; }
}