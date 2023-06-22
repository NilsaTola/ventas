package Interfaces;

import Modelo.Ventas;
import java.util.List;

public interface CRUD4 {
    public List listar();
    public Ventas list(int id);
    public boolean add(Ventas ven);
    public boolean edit(Ventas ven);
    public boolean eliminar(int id);
    
}
