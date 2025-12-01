<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mini App Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f6f8fa;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        .app-container {
            margin-top: 20px;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            box-shadow: 0 0 5px rgba(0,0,0,0.15);
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #007aff;
            color: white;
            text-align: left;
        }
        tr:hover {
            background: #f1f1f1;
        }
        .btn {
            background: #007aff;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>

    <script>
        async function loadApps() {
            const response = await fetch("http://localhost:8080/api/apps");
            const apps = await response.json();
            const table = document.getElementById("appsTableBody");

            apps.forEach(app => {
                const row = `
                    <tr>
                        <td>${app.id}</td>
                        <td>${app.name}</td>
                        <td>${app.developerName}</td>
                        <td>${app.category}</td>
                        <td>${app.price}</td>
                        <td>${app.rating}</td>
                    </tr>
                `;
                table.innerHTML += row;
            });
        }

        window.onload = loadApps;
    </script>
</head>

<body>
<h1>Mini App Store</h1>

<div class="app-container">
    <a href="#" class="btn">+ Add New App</a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>App Name</th>
            <th>Developer</th>
            <th>Category</th>
            <th>Price ($)</th>
            <th>Rating</th>
        </tr>
        </thead>
        <tbody id="appsTableBody">
        <!-- Dynamic rows added by JavaScript -->
        </tbody>
    </table>
</div>

</body>
</html>
