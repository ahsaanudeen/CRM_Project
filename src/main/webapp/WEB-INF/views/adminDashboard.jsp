<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    <title>CRM - Admin Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #1a202c;
            line-height: 1.6;
        }

        .container {
            display: flex;
            min-height: 100vh;
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.08);
            padding: 0 2rem;
            z-index: 1000;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
        }

        .logo {
            font-size: 1.75rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header nav {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .header nav a {
            text-decoration: none;
            color: #4a5568;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
        }

        .header nav a:hover {
            color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-1px);
        }

        .search-container {
            display: flex;
            align-items: center;
            background: #f7fafc;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            padding: 0.5rem;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .search-container:focus-within {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .search-container input {
            border: none;
            background: transparent;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
            width: 250px;
            outline: none;
            color: #2d3748;
        }

        .search-container button {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .search-container button:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            left: 0;
            top: 70px;
            width: 280px;
            height: calc(100vh - 70px);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-right: 1px solid rgba(0, 0, 0, 0.08);
            padding: 2rem 0;
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.05);
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 1rem 2rem;
            text-decoration: none;
            color: #4a5568;
            font-weight: 500;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
        }

        .sidebar a:hover, .sidebar a.active {
            background: linear-gradient(90deg, rgba(102, 126, 234, 0.1), rgba(102, 126, 234, 0.05));
            color: #667eea;
            border-left-color: #667eea;
            transform: translateX(4px);
        }

        .sidebar a i {
            width: 24px;
            margin-right: 1rem;
            font-size: 1.1rem;
        }

        /* Main Content */
        .main-content {
            margin-left: 280px;
            margin-top: 70px;
            padding: 2rem;
            flex: 1;
        }

        .page-title {
            color: white;
            font-size: 2.25rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .page-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1rem;
            margin-bottom: 2rem;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
        }

        .card h2 {
            color: #2d3748;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .card h2::before {
            content: '';
            width: 4px;
            height: 24px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 2px;
        }

        .analytics-content {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1));
            padding: 1.5rem;
            border-radius: 12px;
            border-left: 4px solid #667eea;
        }

        .analytics-content p {
            color: #4a5568;
            font-size: 1rem;
            font-weight: 500;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.05);
        }

        .table thead {
            background: linear-gradient(135deg, #667eea, #764ba2);
        }

        .table thead th {
            padding: 1.25rem 1.5rem;
            text-align: left;
            font-weight: 600;
            color: white;
            font-size: 0.9rem;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }

        .table tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid #e2e8f0;
        }

        .table tbody tr:hover {
            background: linear-gradient(90deg, rgba(102, 126, 234, 0.05), rgba(118, 75, 162, 0.05));
            transform: scale(1.01);
        }

        .table tbody tr:last-child {
            border-bottom: none;
        }

        .table tbody td {
            padding: 1.25rem 1.5rem;
            color: #4a5568;
            font-weight: 500;
        }

        .status-updated {
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
            padding: 0.375rem 0.75rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .action-icons {
            display: flex;
            gap: 0.75rem;
        }

        .action-icons a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            text-decoration: none;
            transition: all 0.3s ease;
            color: #718096;
        }

        .action-icons a:nth-child(1) {
            background: linear-gradient(135deg, #4299e1, #3182ce);
            color: white;
        }

        .action-icons a:nth-child(2) {
            background: linear-gradient(135deg, #48bb78, #38a169);
            color: white;
        }

        .action-icons a:nth-child(3) {
            background: linear-gradient(135deg, #ed8936, #dd6b20);
            color: white;
        }

        .action-icons a:hover {
            transform: translateY(-2px) scale(1.1);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        /* No data state */
        .no-data {
            text-align: center;
            padding: 3rem;
            color: #718096;
        }

        .no-data i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: #cbd5e0;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .sidebar {
                width: 240px;
            }
            
            .main-content {
                margin-left: 240px;
            }
            
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .header {
                padding: 0 1rem;
            }
            
            .search-container {
                display: none;
            }
            
            .page-title {
                font-size: 1.75rem;
            }
        }

        /* Loading Animation */
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }

        .loading {
            animation: pulse 2s infinite;
        }

        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(0, 0, 0, 0.05);
        }

        ::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, #5a67d8, #6b46c1);
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <i class="fas fa-chart-line"></i> CRM Pro
        </div>
        <nav>
            <a href="/admin/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <div class="search-container">
                <input type="text" id="search-input" placeholder="Search by email or number">
                <button onclick="searchLeads()"><i class="fas fa-search"></i></button>
            </div>
            <a href="/admin/leads"><i class="fas fa-users"></i> Leads</a>
            <a href="/admin/reports"><i class="fas fa-chart-bar"></i> Reports</a>
            <a href="/notifications"><i class="fas fa-bell"></i> Notifications</a>
            <a href="#" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </nav>
    </div>

    <div class="sidebar">
        <a href="/admin/leads" class="active"><i class="fas fa-users"></i> Manage Leads</a>
        <a href="/admin/reports"><i class="fas fa-chart-bar"></i> Reports</a>
        <a href="/admin/customer-support"><i class="fas fa-headset"></i> Customer Support</a>
        <a href="/admin/tasks"><i class="fas fa-tasks"></i> Tasks</a>
        <a href="/admin/email-logs"><i class="fas fa-envelope"></i> Email Logs</a>
    </div>

    <div class="main-content">
        <h1 class="page-title"><i class="fas fa-tachometer-alt"></i> Admin Dashboard</h1>
        <p class="page-subtitle">Welcome back! Here's what's happening with your leads today.</p>
        
        <div class="dashboard-grid">
            <div class="card">
                <h2><i class="fas fa-chart-pie"></i> Analytics</h2>
                <div class="analytics-content">
                    <p><strong>Lead Distribution:</strong><br>
                    🔵 Prospects: 50 leads<br>
                    🟡 Follow-Up: 30 leads<br>
                    🟢 Evaluation: 20 leads</p>
                </div>
            </div>

            <div class="card">
                <h2><i class="fas fa-users"></i> All Leads</h2>
                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user"></i> Lead Name</th>
                                <th><i class="fas fa-flag"></i> Stage</th>
                                <th><i class="fas fa-user-tie"></i> Owner</th>
                                <th><i class="fas fa-clock"></i> Modified On</th>
                                <th><i class="fas fa-cogs"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty leads}">
                                    <c:forEach var="lead" items="${leads}">
                                        <tr>
                                            <td><strong>${lead.firstName} ${lead.lastName}</strong></td>
                                            <td><span class="status-updated">${lead.stage}</span></td>
                                            <td>${lead.owner.username}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty lead.modifiedOn}">
                                                        <fmt:formatDate value="${lead.modifiedOn}" pattern="dd-MM-yyyy HH:mm:ss"/>
                                                    </c:when>
                                                    <c:otherwise>Unknown</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="action-icons">
                                                <a href="#" onclick="alert('Email action not implemented')" title="Send Email">
                                                    <i class="fas fa-envelope"></i>
                                                </a>
                                                <a href="#" onclick="alert('Phone action not implemented')" title="Make Call">
                                                    <i class="fas fa-phone"></i>
                                                </a>
                                                <a href="#" onclick="alert('View action not implemented')" title="View Details">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="5" class="no-data">
                                            <i class="fas fa-inbox"></i><br>
                                            <strong>No leads available</strong><br>
                                            <small>Start by adding some leads to your CRM</small>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        async function logout() {
            try {
                const response = await fetch('/api/logout', {
                    method: 'GET',
                    credentials: 'include'
                });
                const result = await response.json();
                if (result.success) {
                    window.location.href = '/login';
                }
            } catch (error) {
                console.error('Logout failed:', error);
            }
        }

        async function searchLeads() {
            const searchInput = document.getElementById('search-input').value.trim();
            if (!searchInput) {
                alert('Please enter an email or number to search.');
                return;
            }

            const searchData = {
                email: searchInput.includes('@') ? searchInput : '',
                number: !searchInput.includes('@') ? searchInput : ''
            };

            try {
                const response = await fetch('/api/search', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(searchData),
                    credentials: 'include'
                });

                if (response.ok) {
                    const lead = await response.json();
                    renderLead(lead);
                } else {
                    alert('No lead found.');
                    clearTable();
                }
            } catch (error) {
                console.error('Error searching lead:', error);
                alert('An error occurred while searching. Please try again.');
                clearTable();
            }
        }

        function renderLead(lead) {
            const tableBody = document.querySelector('.table tbody');
            tableBody.innerHTML = '';

            const row = document.createElement('tr');
            row.innerHTML = `
                <td><strong>${lead.name}</strong></td>
                <td><span class="status-updated">${lead.stage}</span></td>
                <td>
                    <c:choose>
                        <c:when test="${not empty lead.owner and not empty lead.owner.username}">
                            ${lead.owner.username}
                        </c:when>
                        <c:otherwise>
                            Unknown
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${not empty lead.modifiedOn}">
                            <fmt:formatDate value="${lead.modifiedOn}" pattern="dd-MM-yyyy HH:mm:ss" />
                        </c:when>
                        <c:otherwise>
                            Unknown
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="action-icons">
                    <a href="#" onclick="alert('Email action not implemented')" title="Send Email">
                        <i class="fas fa-envelope"></i>
                    </a>
                    <a href="#" onclick="alert('Phone action not implemented')" title="Make Call">
                        <i class="fas fa-phone"></i>
                    </a>
                    <a href="#" onclick="alert('View action not implemented')" title="View Details">
                        <i class="fas fa-eye"></i>
                    </a>
                </td>
            `;
            tableBody.appendChild(row);
        }

        function clearTable() {
            const tableBody = document.querySelector('.table tbody');
            tableBody.innerHTML = `
                <tr>
                    <td colspan="5" class="no-data">
                        <i class="fas fa-search"></i><br>
                        <strong>No lead found</strong><br>
                        <small>Try searching with a different email or number</small>
                    </td>
                </tr>
            `;
        }

        // Add smooth scrolling and loading states
        document.addEventListener('DOMContentLoaded', function() {
            // Add loading animation to action buttons
            const actionButtons = document.querySelectorAll('.action-icons a');
            actionButtons.forEach(button => {
                button.addEventListener('click', function() {
                    this.classList.add('loading');
                    setTimeout(() => {
                        this.classList.remove('loading');
                    }, 1000);
                });
            });
        });
    </script>
</body>
</html>