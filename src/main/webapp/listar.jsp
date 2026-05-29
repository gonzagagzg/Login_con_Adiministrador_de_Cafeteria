<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grand Royal Coffee ITQ | Inventario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleapp.css">
</head>
<body>
<div id="bg-animation"></div>
<div class="container">
    <div class="nav-actions">
        <div>
            <h2>Bienvenido, ${sessionScope.usuario.username}</h2>
            <p style="font-style: italic; color: var(--secondary-color); margin-top: -1.5rem;">Gestión de Inventario</p>
        </div>
        <div style="display: flex; flex-direction: row; justify-content: center; align-items: center; flex-wrap: wrap; gap: 10px;">
            <a><img src="./Multimedia/itq.png" alt="Logo ITQ" style="width: 60px; height: 60px; border-radius: 100%;"></a>
            <a href="${pageContext.request.contextPath}/productos?action=crear" class="btn btn-cyan">Añadir Producto</a>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-exit">Cerrar Sesión</a>
        </div>
    </div>

    <div class="table-wrapper">
        <table border="0">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th class="hide-mobile">Categoría</th>
                    <th class="hide-mobile">Fecha</th>
                    <th>Estado</th>
                    <th style="text-align: center;">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${productos}">
                    <tr>
                        <td style="font-family: serif; font-weight: bold; color: var(--primary-color);">#${p.id}</td>
                        <td><strong>${p.nombre}</strong></td>
                        <td style="font-style: italic;"><fmt:formatNumber value="${p.precio}" type="currency" currencySymbol="$"/></td>
                        <td class="hide-mobile">${p.categoria.nombre}</td>
                        <td class="hide-mobile"><fmt:formatDate value="${p.fechaElaboracion}" pattern="dd/MM/yyyy"/></td>
                        <td>
                            <span style="color: ${p.estado ? 'green' : 'var(--primary-color)'}; font-weight: bold; font-size: 0.8rem;">
                                ${p.estado ? 'DISPONIBLE' : 'AGOTADO'}
                            </span>
                        </td>
                        <td style="text-align: center;">
                            <div style="display: flex; gap: 10px; justify-content: center; flex-wrap: wrap;">
                                <a href="${pageContext.request.contextPath}/productos?action=editar&id=${p.id}" style="color: var(--primary-color); text-decoration: none; border-bottom: 1px solid var(--secondary-color);">Editar</a>
                                <a href="javascript:void(0)" onclick="confirmDelete('${p.id}', '${p.nombre}')" style="color: #666; text-decoration: none; font-size: 0.9rem;">Eliminar</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div id="deleteModal" class="modal">
    <div class="modal-content">
        <h3>Confirmar Eliminación</h3>
        <p>¿Está seguro de que desea retirar el producto <br><strong id="productNameLabel"></strong> del inventario?</p>
        <div class="modal-footer">
            <button onclick="closeModal()" class="btn" style="background: transparent; color: #666; border-color: #666;">Cancelar</button>
            <a id="confirmDeleteBtn" href="#" class="btn">Confirmar</a>
        </div>
    </div>
</div>

<script>
    function confirmDelete(id, name) {
        const modal = document.getElementById('deleteModal');
        const label = document.getElementById('productNameLabel');
        const btn = document.getElementById('confirmDeleteBtn');

        label.textContent = name;
        btn.href = '${pageContext.request.contextPath}/productos?action=eliminar&id=' + id;
        modal.style.display = 'block';
    }

    function closeModal() {
        document.getElementById('deleteModal').style.display = 'none';
    }

    window.onclick = function(event) {
        const modal = document.getElementById('deleteModal');
        if (event.target == modal) {
            closeModal();
        }
    }
</script>
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