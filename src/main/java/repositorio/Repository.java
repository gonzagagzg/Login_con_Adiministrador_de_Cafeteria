package repositorio;

import java.util.List;

public interface Repository<T> {
    List<T> listar();
    T porId(int id);
    void guardar(T t); // Sirve para insertar y actualizar
    void eliminar(int id);
}