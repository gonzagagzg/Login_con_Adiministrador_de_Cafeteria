<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grand Royal Coffee ITQ | LOGIN</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleapp.css">
</head>
<body>
<div id="bg-animation"></div>
<div class="container" style="max-width: 450px;">
   <div style="display: flex; justify-content: center; align-content: center;">
    <img class="logo" src="./Multimedia/itq.png" alt="Logo ITQ">
   </div>
    <h2 > Grand Royal Coffee ITQ </h2>
    <div style="text-align: center; margin-bottom: 20px; font-style: italic; color: var(--secondary-color);">
        ~ Establecido en 2026 por DeveloperITQ ~
    </div>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <c:if test="${param.success eq 'true'}">
        <div class="error-msg" style="background: #d4edda; color: #155724; border-color: #c3e6cb;">
            ¡Registro exitoso! Ya puede iniciar sesión.
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label>Identificación de Usuario</label>
            <input type="text" name="username" placeholder="Ingrese su usuario..." required>
        </div>
        <div class="form-group">
            <label>Contraseña</label>
            <input type="password" name="password" placeholder="••••••••" required>
        </div>
        <br>
        <button type="submit">Entrar</button>
        <div style="text-align: center; margin-top: 1rem;">
            <a href="${pageContext.request.contextPath}/registro" style="color: var(--primary-color); text-decoration: none; font-size: 0.9rem; border-bottom: 1px solid var(--secondary-color);">¿No tiene una cuenta? Registrese</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
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