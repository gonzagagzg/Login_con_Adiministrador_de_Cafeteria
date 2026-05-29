<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cafeteria ITQ | Administración de Producto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleapp.css">
</head>
<body>
<div id="bg-animation"></div>
<div class="container" style="max-width: 600px;">
    <h2>${producto.id > 0 ? "Modificar Registro" : "Nuevo Registro"}</h2>

    <form action="${pageContext.request.contextPath}/productos" method="post">
        <input type="hidden" name="id" value="${producto.id}">

        <div class="form-group">
            <label>Nombre del Producto</label>
            <input type="text" name="nombre" value="${producto.nombre}" placeholder="Nombre distinguido..." required>
        </div>

        <div class="form-group">
            <label>Precio de Venta</label>
            <input type="number" step="0.01" name="precio" value="${producto.precio}" placeholder="0.00" required>
        </div>

        <div class="form-group">
            <label>Categoría Seleccionada</label>
            <select name="categoria" required>
                <option value="">Seleccione una categoría...</option>
                <c:forEach var="cat" items="${categorias}">
                    <option value="${cat.id}" ${not empty producto.categoria and producto.categoria.id == cat.id ? 'selected' : ''}>
                        ${cat.nombre}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>Fecha de Preparación/Elaboración</label>
            <fmt:formatDate var="fechaFormateada" value="${producto.fechaElaboracion}" pattern="yyyy-MM-dd"/>
            <input type="date" name="fechaElaboracion" value="${fechaFormateada}" required>
        </div>

        <div class="form-group" style="flex-direction: row; align-items: center; gap: 10px; padding: 10px 0;">
            <input type="checkbox" id="estado" name="estado" value="true" ${(empty producto.id or producto.id == 0 or producto.estado) ? 'checked' : ''}>
            <label for="estado" style="cursor: pointer;">¿Producto en existencia y apto para el servicio?</label>
        </div>

        <div style="display: flex; gap: 1.5rem; margin-top: 1.5rem;">
            <button type="submit" style="flex: 2;">Confirmar Registro</button>
            <a href="${pageContext.request.contextPath}/productos" class="btn" style="flex: 1; background: transparent; border-color: #666; color: #666;">Volver</a>
        </div>
    </form>
</div>
<script>
    const bg = document.getElementById('bg-animation');

    window.onmousemove = function(e) {
        if (bg) {
            const x = (e.clientX - window.innerWidth / 4) / 80;
            const y = (e.clientY - window.innerHeight / 4) / 80;

            bg.style.transform = "translate(" + (-x) + "px, " + (-y) + "px)";
        }
    };
</script>
</body>
</html>