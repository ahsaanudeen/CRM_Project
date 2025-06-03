<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Pro - Sign In</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem;
            position: relative;
            overflow: hidden;
        }

        /* Animated Background Elements */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: 
                radial-gradient(circle at 25% 25%, rgba(255, 255, 255, 0.1) 0%, transparent 50%),
                radial-gradient(circle at 75% 75%, rgba(255, 255, 255, 0.05) 0%, transparent 50%);
            animation: float 20s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 3rem;
            border-radius: 24px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 440px;
            text-align: center;
            position: relative;
            border: 1px solid rgba(255, 255, 255, 0.2);
            animation: slideIn 0.8s ease-out;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .logo-container {
            margin-bottom: 2.5rem;
            position: relative;
        }

        .logo {
            font-size: 2.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            margin-bottom: 0.5rem;
        }

        .logo i {
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .subtitle {
            color: #6b7280;
            font-size: 1.1rem;
            font-weight: 400;
            margin-bottom: 1rem;
        }

        .welcome-text {
            color: #374151;
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .form-container {
            margin-top: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
            position: relative;
        }

        .form-group label {
            display: block;
            color: #374151;
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-group label i {
            color: #6b7280;
            font-size: 0.9rem;
        }

        .input-container {
            position: relative;
        }

        .form-group input {
            width: 100%;
            padding: 1rem 1rem 1rem 3rem;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: #f9fafb;
            color: #1f2937;
            font-weight: 500;
        }

        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            background: white;
            transform: translateY(-1px);
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus + .input-icon {
            color: #667eea;
        }

        .btn {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 1rem 2rem;
            border: none;
            border-radius: 12px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .btn.loading {
            pointer-events: none;
        }

        .btn.loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
        }

        .error-message {
            background: linear-gradient(135deg, #fecaca, #fee2e2);
            color: #dc2626;
            padding: 1rem;
            border-radius: 12px;
            font-size: 0.9rem;
            font-weight: 500;
            margin-top: 1rem;
            display: none;
            border-left: 4px solid #dc2626;
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .error-message.show {
            display: block;
        }

        .divider {
            margin: 2rem 0;
            text-align: center;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, #e5e7eb, transparent);
        }

        .divider span {
            background: rgba(255, 255, 255, 0.95);
            padding: 0 1rem;
            color: #6b7280;
            font-size: 0.9rem;
        }

        .footer {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(0, 0, 0, 0.08);
            font-size: 0.9rem;
            color: #6b7280;
        }

        .footer a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .footer a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .security-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-top: 1.5rem;
            padding: 0.75rem;
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.1), rgba(22, 163, 74, 0.1));
            border-radius: 8px;
            color: #059669;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .login-container {
                padding: 2rem;
                margin: 1rem;
            }
            
            .logo {
                font-size: 2rem;
            }
            
            .welcome-text {
                font-size: 1.5rem;
            }
        }

        /* Custom Scrollbar */
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

        /* Password visibility toggle */
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #9ca3af;
            cursor: pointer;
            font-size: 1.1rem;
            transition: color 0.3s ease;
        }

        .password-toggle:hover {
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <div class="logo">
                <i class="fas fa-chart-line"></i>
                CRM Pro
            </div>
            <div class="subtitle">Professional Customer Relationship Management</div>
        </div>
        
        <div class="welcome-text">Welcome Back</div>
        <p style="color: #6b7280; margin-bottom: 0;">Sign in to your account to continue</p>
        
        <div class="form-container">
            <form id="loginForm">
                <div class="form-group">
                    <label for="username">
                        <i class="fas fa-envelope"></i>
                        Email Address
                    </label>
                    <div class="input-container">
                        <input type="email" id="username" name="username" required placeholder="Enter your email">
                        <i class="fas fa-envelope input-icon"></i>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">
                        <i class="fas fa-lock"></i>
                        Password
                    </label>
                    <div class="input-container">
                        <input type="password" id="password" name="password" required placeholder="Enter your password">
                        <i class="fas fa-lock input-icon"></i>
                        <button type="button" class="password-toggle" onclick="togglePassword()">
                            <i class="fas fa-eye" id="toggleIcon"></i>
                        </button>
                    </div>
                </div>
                
                <button type="submit" class="btn" id="loginBtn">
                    <span class="btn-text">Sign In</span>
                </button>
                
                <div id="errorMessage" class="error-message">
                    <i class="fas fa-exclamation-triangle"></i>
                    <span id="errorText"></span>
                </div>
            </form>
        </div>

        <div class="security-badge">
            <i class="fas fa-shield-alt"></i>
            <span>Secure SSL Encrypted Connection</span>
        </div>
        
        <div class="footer">
            <a href="#" onclick="showModal('terms')">Terms of Service</a> | 
            <a href="#" onclick="showModal('privacy')">Privacy Policy</a>
            <div style="margin-top: 1rem; font-size: 0.8rem; opacity: 0.7;">
                © 2024 CRM Pro. All rights reserved.
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.className = 'fas fa-eye-slash';
            } else {
                passwordInput.type = 'password';
                toggleIcon.className = 'fas fa-eye';
            }
        }

        function showModal(type) {
            if (type === 'terms') {
                alert('Terms of Service - This would open the terms of service page.');
            } else if (type === 'privacy') {
                alert('Privacy Policy - This would open the privacy policy page.');
            }
        }

        document.getElementById('loginForm').addEventListener('submit', async function (event) {
            event.preventDefault();

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const errorMessage = document.getElementById('errorMessage');
            const errorText = document.getElementById('errorText');
            const loginBtn = document.getElementById('loginBtn');
            const btnText = loginBtn.querySelector('.btn-text');

            // Reset error state
            errorMessage.classList.remove('show');
            
            // Show loading state
            loginBtn.classList.add('loading');
            loginBtn.disabled = true;
            btnText.textContent = 'Signing In...';

            try {
                const response = await fetch('/api/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ username, password }),
                    credentials: 'include'
                });

                const result = await response.json();

                if (response.ok && result.success) {
                    btnText.textContent = 'Success! Redirecting...';
                    
                    const roleResponse = await fetch('/api/get-role', {
                        method: 'GET',
                        credentials: 'include'
                    });
                    const roleData = await roleResponse.json();
                    
                    // Small delay for better UX
                    setTimeout(() => {
                        if (roleData.role === 'ADMIN') {
                            window.location.href = '/admin/dashboard';
                        } else if (roleData.role === 'EMPLOYEE') {
                            window.location.href = '/employee/dashboard';
                        }
                    }, 500);
                } else {
                    throw new Error(result.message || 'Login failed');
                }
            } catch (error) {
                console.error('Login error:', error);
                errorText.textContent = error.message || 'An error occurred. Please try again.';
                errorMessage.classList.add('show');
                
                // Reset button state
                loginBtn.classList.remove('loading');
                loginBtn.disabled = false;
                btnText.textContent = 'Sign In';
                
                // Add shake animation to form
                document.querySelector('.login-container').style.animation = 'shake 0.5s ease-in-out';
                setTimeout(() => {
                    document.querySelector('.login-container').style.animation = '';
                }, 500);
            }
        });

        // Add input focus animations
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input');
            
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentNode.style.transform = 'translateY(-2px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentNode.style.transform = 'translateY(0)';
                });
            });
        });

        // Add floating animation to background elements
        document.addEventListener('mousemove', function(e) {
            const cursor = { x: e.clientX, y: e.clientY };
            const container = document.querySelector('.login-container');
            const rect = container.getBoundingClientRect();
            const center = {
                x: rect.left + rect.width / 2,
                y: rect.top + rect.height / 2
            };
            
            const deltaX = (cursor.x - center.x) * 0.01;
            const deltaY = (cursor.y - center.y) * 0.01;
            
            container.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
        });
    </script>
</body>
</html>