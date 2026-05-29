<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grand Royal Coffee ITQ | Registro</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleapp.css">
</head>
<body>
<div id="bg-animation"></div>
<div class="container" style="max-width: 500px;">
    <div style="display: flex; justify-content: center; align-content: center;">
        <img class="logo" src="./Multimedia/itq.png" alt="Logo ITQ">
    </div>
    <h2>Registro de Usuario</h2>
    <div style="text-align: center; margin-bottom: 20px; font-style: italic; color: var(--secondary-color);">
        ~ Únase a nuestra comunidad ~
    </div>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/registro" method="post">
        <div class="form-group">
            <label>Nombre de Usuario</label>
            <input type="text" name="username" placeholder="Elija un nombre de usuario..." required>
        </div>
        <div class="form-group">
            <label>Correo Electrónico</label>
            <input type="email" name="email" placeholder="ejemplo@correo.com"
                   style="background: transparent; border: none; border-bottom: 1px solid var(--border-color); padding: 0.8rem 0.5rem; font-family: 'Lora', serif; font-size: 1rem;" required>
        </div>
        <div class="form-group">
            <label>Contraseña</label>
            <input type="password" name="password" placeholder="••••••••" required>
        </div>
        <br>
        <button type="submit">Completar Registro</button>
        <div style="text-align: center; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/login.jsp" style="color: var(--primary-color); text-decoration: none; font-size: 0.9rem; border-bottom: 1px solid var(--secondary-color);">¿Ya tiene una cuenta? Iniciar Sesión</a>
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