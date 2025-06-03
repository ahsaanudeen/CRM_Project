<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leads Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            padding: 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .header h2 {
            font-size: 2.5rem;
            font-weight: 300;
            margin: 0;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .create-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 500;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.3);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .create-btn:hover {
            background: rgba(255,255,255,0.3);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        .create-btn::before {
            content: '+';
            font-size: 18px;
            font-weight: bold;
        }

        .table-container {
            padding: 30px;
            overflow-x: auto;
        }

        .leads-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .leads-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 18px 15px;
            text-align: left;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.85rem;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .leads-table td {
            padding: 18px 15px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            transition: all 0.3s ease;
        }

        .leads-table tr:hover {
            background: linear-gradient(135deg, #f8f9ff 0%, #f0f4ff 100%);
            transform: scale(1.01);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .leads-table tr:last-child td {
            border-bottom: none;
        }

        .stage-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            text-transform: capitalize;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            box-shadow: 0 2px 8px rgba(17, 153, 142, 0.3);
        }

        .actions {
            display: flex;
            gap: 8px;
            align-items: center;
        }

        .action-btn {
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .edit-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        .edit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(102, 126, 234, 0.4);
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            color: white;
        }

        .delete-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(255, 107, 107, 0.4);
        }

        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .email {
            font-size: 0.9rem;
            color: #666;
        }

        .phone {
            font-weight: 600;
            color: #333;
        }

        .education-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .degree {
            font-weight: 600;
            color: #4facfe;
        }

        .college {
            font-size: 0.9rem;
            color: #666;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: #333;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 15px;
            }

            .header {
                padding: 20px;
                text-align: center;
            }

            .header h2 {
                font-size: 2rem;
            }

            .table-container {
                padding: 20px;
            }

            .leads-table {
                font-size: 0.9rem;
            }

            .leads-table th,
            .leads-table td {
                padding: 12px 8px;
            }

            .actions {
                flex-direction: column;
                gap: 4px;
            }

            .action-btn {
                font-size: 0.8rem;
                padding: 6px 12px;
            }
        }

        @media (max-width: 480px) {
            .leads-table th:nth-child(n+4),
            .leads-table td:nth-child(n+4) {
                display: none;
            }
        }

        .fade-in {
            animation: fadeIn 0.6s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container fade-in">
        <div class="header">
            <h2>Leads Management</h2>
            <a href="/admin/leads/create" class="create-btn">Create New Lead</a>
        </div>
        
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty leads}">
                    <table class="leads-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Contact</th>
                                <th>Stage</th>
                                <th>Education</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="lead" items="${leads}">
                                <tr>
                                    <td>
                                        <strong>${lead.name}</strong>
                                    </td>
                                    <td>
                                        <div class="contact-info">
                                            <span class="phone">${lead.number}</span>
                                            <span class="email">${lead.email}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="stage-badge">${lead.stage}</span>
                                    </td>
                                    <td>
                                        <div class="education-info">
                                            <span class="degree">${lead.degree}</span>
                                            <span class="college">${lead.college}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <a href="/admin/leads/edit/${lead.number}" class="action-btn edit-btn">✏️ Edit</a>
                                            <a href="/admin/leads/delete/${lead.number}" class="action-btn delete-btn" 
                                               onclick="return confirm('Are you sure you want to delete this lead?')">🗑️ Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <h3>No leads found</h3>
                        <p>Start by creating your first lead to see them listed here.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>