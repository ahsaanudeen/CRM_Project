<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM - Employee Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --secondary: #f1f5f9;
            --accent: #0ea5e9;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --dark: #1e293b;
            --light: #f8fafc;
            --border: #e2e8f0;
            --text-primary: #334155;
            --text-secondary: #64748b;
            --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            color: var(--text-primary);
            line-height: 1.6;
        }

        .dashboard-container {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);
            padding: 1rem 2rem;
            box-shadow: var(--shadow-lg);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--border);
            backdrop-filter: blur(10px);
        }

        .header .logo {
            font-size: 28px;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .header .logo:hover {
            transform: scale(1.05);
        }

        .header nav {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .nav-search-bar {
            position: relative;
            margin-right: 1rem;
        }

        .nav-search-bar input {
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 2px solid var(--border);
            border-radius: 50px;
            font-size: 14px;
            width: 300px;
            background: var(--light);
            transition: all 0.3s ease;
            outline: none;
        }

        .nav-search-bar input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
            background: white;
        }

        .nav-search-bar .nav-search-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
            font-size: 16px;
            cursor: pointer;
            transition: color 0.2s ease;
        }

        .nav-search-bar .nav-search-icon:hover {
            color: var(--primary);
        }

        .header nav a {
            padding: 0.75rem 1.5rem;
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
            border-radius: 50px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .header nav a:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        /* Sidebar Styles */
        .sidebar {
            background: linear-gradient(180deg, #ffffff 0%, #f8fafc 100%);
            width: 280px;
            position: fixed;
            top: 80px;
            bottom: 0;
            box-shadow: var(--shadow-lg);
            padding: 2rem 0;
            border-right: 1px solid var(--border);
        }

        .sidebar a {
            display: flex;
            align-items: center;
            padding: 1rem 2rem;
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0.25rem 1rem;
            border-radius: 12px;
            position: relative;
        }

        .sidebar a i {
            margin-right: 1rem;
            width: 20px;
            text-align: center;
            font-size: 18px;
        }

        .sidebar a:hover {
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            color: white;
            transform: translateX(8px);
            box-shadow: var(--shadow);
        }

        /* Main Content */
        .main-content {
            margin-left: 280px;
            margin-top: 100px;
            padding: 2rem;
            flex: 1;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .page-title i {
            color: var(--primary);
        }

        /* Card Styles */
        .card {
            background: white;
            padding: 2rem;
            border-radius: 20px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            border: 1px solid var(--border);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .card h2 {
            font-size: 24px;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .card h2 i {
            color: var(--primary);
        }

        /* Enhanced Table Styles */
        .table-container {
            overflow-x: auto;
            border-radius: 12px;
            border: 1px solid var(--border);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .table th {
            padding: 1.25rem 1rem;
            text-align: left;
            background: linear-gradient(135deg, var(--secondary) 0%, #e2e8f0 100%);
            font-weight: 600;
            color: var(--dark);
            border-bottom: 2px solid var(--border);
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table td {
            padding: 1.25rem 1rem;
            color: var(--text-primary);
            border-bottom: 1px solid var(--border);
            transition: background-color 0.2s ease;
        }

        .table tbody tr:hover {
            background: var(--light);
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Action Icons */
        .action-icons {
            display: flex;
            gap: 0.75rem;
        }

        .action-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 14px;
        }

        .action-icons a.edit {
            background: var(--warning);
            color: white;
        }

        .action-icons a.delete {
            background: var(--danger);
            color: white;
        }

        .action-icons a.view {
            background: var(--accent);
            color: white;
        }

        .action-icons a:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        /* Stage Badge */
        .stage-badge {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .stage-prospect {
            background: #dbeafe;
            color: #1e40af;
        }

        .stage-follow-up {
            background: #fef3c7;
            color: #92400e;
        }

        .stage-evaluation {
            background: #dcfce7;
            color: #166534;
        }

        /* Score Badge */
        .score-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            background: linear-gradient(135deg, var(--success) 0%, #059669 100%);
            color: white;
            border-radius: 50px;
            font-weight: 600;
            font-size: 14px;
        }

        /* Loading State */
        .loading {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 3rem;
            color: var(--text-secondary);
        }

        .loading i {
            animation: spin 1s linear infinite;
            margin-right: 0.5rem;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: var(--text-secondary);
        }

        .empty-state i {
            font-size: 4rem;
            margin-bottom: 1rem;
            color: var(--border);
        }

        .empty-state h3 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
            color: var(--text-primary);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }

            .main-content {
                margin-left: 0;
            }

            .header nav {
                display: none;
            }

            .nav-search-bar input {
                width: 200px;
            }
        }
    </style>
</head>

<body>
    <div class="dashboard-container">
        <!-- Header -->
        <div class="header">
            <div class="logo" onclick="goToDashboard()">
                <i class="fas fa-chart-line"></i> CRM
            </div>
            <nav>
                <div class="nav-search-bar">
                    <input type="text" id="nav-search-input" placeholder="Search leads..." 
                           onkeypress="if(event.key === 'Enter') searchFromNav('employee')">
                    <i class="fas fa-search nav-search-icon" onclick="searchFromNav('employee')"></i>
                </div>
                <a href="employee.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                <a href="employee-leads.jsp"><i class="fas fa-users"></i> Leads</a>
                <a href="#" onclick="alert('Tasks page not implemented')"><i class="fas fa-tasks"></i> Tasks</a>
                <a href="#" onclick="alert('Notifications page not implemented')"><i class="fas fa-bell"></i> Notifications</a>
                <a href="#" onclick="alert('Customer Support not implemented')"><i class="fas fa-headset"></i> Support</a>
                <a href="#" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </nav>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <a href="employee-leads.jsp">
                <i class="fas fa-users"></i>
                My Leads
            </a>
            <a href="#" onclick="alert('My Tasks page not implemented')">
                <i class="fas fa-tasks"></i>
                My Tasks
            </a>
            <a href="#" onclick="alert('Email Logs page not implemented')">
                <i class="fas fa-envelope"></i>
                Email Logs
            </a>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-users"></i>
                    My Leads
                </h1>
            </div>

            <div class="card">
                <h2>
                    <i class="fas fa-list"></i>
                    Lead Management
                </h2>
                
                <div class="table-container">
                    <table class="table">
                        <thead>
                            <tr>
                                <th><i class="fas fa-user"></i> Lead Name</th>
                                <th><i class="fas fa-flag"></i> Stage</th>
                                <th><i class="fas fa-star"></i> Score</th>
                                <th><i class="fas fa-cog"></i> Actions</th>
                            </tr>
                        </thead>
                        <tbody id="employee-leads-table">
                            <tr class="loading">
                                <td colspan="4">
                                    <i class="fas fa-spinner"></i>
                                    Loading leads...
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="utils.js"></script>
    <script>
        function goToDashboard() {
            window.location.href = 'employee.jsp';
        }

        async function fetchLeads() {
            try {
                const response = await fetch('/api/all', { credentials: 'include' });
                if (!response.ok) throw new Error('Failed to fetch leads');
                const leads = await response.json();
                const tableBody = document.getElementById('employee-leads-table');
                
                if (leads.length === 0) {
                    tableBody.innerHTML = `
                        <tr>
                            <td colspan="4" class="empty-state">
                                <i class="fas fa-users"></i>
                                <h3>No leads found</h3>
                                <p>Start by adding some leads to manage them here.</p>
                            </td>
                        </tr>
                    `;
                    return;
                }

                tableBody.innerHTML = '';
                leads.forEach(lead => {
                    const stageClass = lead.stage.toLowerCase().replace(/[^a-z]/g, '-');
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>
                            <div style="display: flex; align-items: center; gap: 0.75rem;">
                                <div style="width: 40px; height: 40px; border-radius: 50%; background: linear-gradient(135deg, var(--primary), var(--accent)); display: flex; align-items: center; justify-content: center; color: white; font-weight: 600; font-size: 16px;">
                                    ${lead.name.charAt(0).toUpperCase()}
                                </div>
                                <div>
                                    <div style="font-weight: 600; color: var(--dark);">${lead.name}</div>
                                    <div style="font-size: 12px; color: var(--text-secondary);">${lead.email || 'No email'}</div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <span class="stage-badge stage-${stageClass}">
                                ${lead.stage}
                            </span>
                        </td>
                        <td>
                            <div class="score-badge">
                                <i class="fas fa-star"></i>
                                75
                            </div>
                        </td>
                        <td>
                            <div class="action-icons">
                                <a href="#" class="view" title="View Details">
                                    <i class="fas fa-eye"></i>
                                </a>
                                <a href="#" class="edit" title="Edit Lead" 
                                   onclick="updateLead('${lead.number}', '${lead.name}', '${lead.email}', '${lead.stage}', '${lead.degree}', '${lead.college}')">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="#" class="delete" title="Delete Lead">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    `;
                    tableBody.appendChild(row);
                });
            } catch (error) {
                console.error('Error fetching leads:', error);
                const tableBody = document.getElementById('employee-leads-table');
                tableBody.innerHTML = `
                    <tr>
                        <td colspan="4" style="text-align: center; padding: 2rem; color: var(--danger);">
                            <i class="fas fa-exclamation-triangle"></i>
                            Failed to fetch leads. Please try again.
                        </td>
                    </tr>
                `;
            }
        }

        async function updateLead(number, name, email, stage, degree, college) {
            const newName = prompt('Enter new name:', name);
            const newEmail = prompt('Enter new email:', email);
            const newStage = prompt('Enter new stage (Prospect, Follow-Up, Evaluation):', stage);
            const newDegree = prompt('Enter new degree:', degree);
            const newCollege = prompt('Enter new college:', college);

            if (newName && newEmail && newStage && newDegree && newCollege) {
                const leadData = {
                    name: newName,
                    number: number,
                    email: newEmail,
                    stage: newStage,
                    degree: newDegree,
                    college: newCollege,
                    modifiedOn: new Date().toISOString()
                };

                try {
                    const response = await fetch(`/api/update/${number}`, {
                        method: 'PUT',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(leadData),
                        credentials: 'include'
                    });
                    const result = await response.text();
                    alert(result);
                    fetchLeads();
                } catch (error) {
                    console.error('Error updating lead:', error);
                    alert('An error occurred. Please try again.');
                }
            }
        }

        function searchFromNav(type) {
            const searchInput = document.getElementById('nav-search-input');
            const searchTerm = searchInput.value.trim();
            if (searchTerm) {
                // Implement search functionality
                console.log('Searching for:', searchTerm);
                // You can add search logic here
            }
        }

        function logout() {
            if (confirm('Are you sure you want to logout?')) {
                // Implement logout logic
                window.location.href = 'login.jsp';
            }
        }

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            // Check authentication (implement as needed)
            // checkAuth('EMPLOYEE', 'employee.jsp');
            fetchLeads();
        });
    </script>
</body>
</html>