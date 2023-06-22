package Interfaces;

import Modelo.Clientes;
import java.util.List;

public interface CRUD {
    public List listar();
    public Clientes list(int id);
    public boolean add(Clientes cli);
    public boolean edit(Clientes cli);
    public boolean eliminar(int id);
    
}
