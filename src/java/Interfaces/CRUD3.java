package Interfaces;

import Modelo.Usuarios;
import java.util.List;

public interface CRUD3 {
    public List listar();
    public Usuarios list(int id);
    public boolean add(Usuarios usu);
    public boolean edit(Usuarios usu);
    public boolean eliminar(int id);
    
}
