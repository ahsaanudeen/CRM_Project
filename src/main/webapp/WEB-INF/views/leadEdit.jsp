<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Lead Information</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 50%, #ec4899 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.05"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.05"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.03"/><circle cx="20" cy="80" r="0.5" fill="white" opacity="0.03"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 32px 64px rgba(0, 0, 0, 0.12), 0 0 0 1px rgba(255, 255, 255, 0.1);
            padding: 48px;
            width: 100%;
            max-width: 600px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #4f46e5, #7c3aed, #ec4899);
            border-radius: 24px 24px 0 0;
        }

        .form-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .form-header h1 {
            color: #1e293b;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 12px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-header p {
            color: #64748b;
            font-size: 16px;
            font-weight: 400;
        }

        .update-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .update-badge::before {
            content: '✏️';
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 28px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 10px;
            color: #374151;
            font-weight: 600;
            font-size: 15px;
            letter-spacing: 0.025em;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 18px 24px;
            border: 2px solid #e5e7eb;
            border-radius: 16px;
            font-size: 16px;
            background: #ffffff;
            color: #1f2937;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            outline: none;
            font-weight: 500;
        }

        .form-group input[type="text"]:focus {
            border-color: #4f46e5;
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
            transform: translateY(-1px);
        }

        .form-group input[type="text"]:hover:not(:focus) {
            border-color: #d1d5db;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
            margin-bottom: 28px;
        }

        .submit-section {
            display: flex;
            gap: 16px;
            margin-top: 40px;
        }

        .submit-btn {
            flex: 1;
            padding: 18px 32px;
            background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
            color: white;
            border: none;
            border-radius: 16px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(79, 70, 229, 0.4);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .cancel-btn {
            padding: 18px 32px;
            background: transparent;
            color: #6b7280;
            border: 2px solid #e5e7eb;
            border-radius: 16px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .cancel-btn:hover {
            background: #f9fafb;
            border-color: #d1d5db;
            color: #374151;
        }

        .field-info {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: #f3f4f6;
            color: #6b7280;
            font-size: 12px;
            padding: 4px 8px;
            border-radius: 8px;
            font-weight: 500;
            opacity: 0;
            transition: all 0.3s ease;
        }

        .form-group:hover .field-info {
            opacity: 1;
        }

        .form-group.modified input {
            border-color: #fbbf24;
            background: #fefce8;
        }

        .form-group.modified .field-info {
            background: #fbbf24;
            color: white;
            opacity: 1;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 32px 24px;
                margin: 10px;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
            
            .form-header h1 {
                font-size: 28px;
            }

            .submit-section {
                flex-direction: column;
            }
        }

        /* Loading animation */
        .submit-btn.loading {
            position: relative;
            color: transparent;
        }

        .submit-btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 24px;
            height: 24px;
            margin: -12px 0 0 -12px;
            border: 3px solid transparent;
            border-top: 3px solid #fff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Success feedback */
        .form-group.success input {
            border-color: #10b981;
            background: #f0fdf4;
        }

        .form-group.error input {
            border-color: #ef4444;
            background: #fef2f2;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <div class="update-badge">Update Mode</div>
            <h1>Edit Lead Information</h1>
            <p>Update the lead details and save your changes</p>
        </div>
        
        <form action="/admin/leads/update" method="post" id="updateForm">
            <input type="hidden" name="id" value="${leadForm.id}" />
            
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" name="name" id="name" value="${leadForm.name}" required>
                <div class="field-info">Required</div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="number">Contact Number</label>
                    <input type="text" name="number" id="number" value="${leadForm.number}" required>
                    <div class="field-info">Phone</div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="text" name="email" id="email" value="${leadForm.email}" required>
                    <div class="field-info">Email</div>
                </div>
            </div>
            
            <div class="form-group">
                <label for="stage">Current Stage</label>
                <input type="text" name="stage" id="stage" value="${leadForm.stage}" required>
                <div class="field-info">Status</div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="degree">Degree</label>
                    <input type="text" name="degree" id="degree" value="${leadForm.degree}" required>
                    <div class="field-info">Education</div>
                </div>
                
                <div class="form-group">
                    <label for="college">College/University</label>
                    <input type="text" name="college" id="college" value="${leadForm.college}" required>
                    <div class="field-info">Institution</div>
                </div>
            </div>
            
            <div class="submit-section">
                <input type="submit" value="Update Lead Information" class="submit-btn" id="submitBtn">
                <button type="button" class="cancel-btn" onclick="history.back()">Cancel</button>
            </div>
        </form>
    </div>

    <script>
        // Store original values to track changes
        const originalValues = {};
        const inputs = document.querySelectorAll('input[type="text"]');
        
        // Initialize original values
        inputs.forEach(input => {
            originalValues[input.name] = input.value;
        });

        // Track field changes
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                const formGroup = this.closest('.form-group');
                if (this.value !== originalValues[this.name]) {
                    formGroup.classList.add('modified');
                    formGroup.querySelector('.field-info').textContent = 'Modified';
                } else {
                    formGroup.classList.remove('modified');
                    // Reset original field info text
                    const fieldInfoMap = {
                        'name': 'Required',
                        'number': 'Phone',
                        'email': 'Email',
                        'stage': 'Status',
                        'degree': 'Education',
                        'college': 'Institution'
                    };
                    formGroup.querySelector('.field-info').textContent = fieldInfoMap[this.name] || 'Field';
                }
            });

            // Validation on blur
            input.addEventListener('blur', function() {
                const formGroup = this.closest('.form-group');
                if (this.value.trim() === '') {
                    formGroup.classList.add('error');
                    formGroup.classList.remove('success');
                } else {
                    formGroup.classList.add('success');
                    formGroup.classList.remove('error');
                }
            });
            
            input.addEventListener('focus', function() {
                const formGroup = this.closest('.form-group');
                formGroup.classList.remove('error', 'success');
            });
        });

        // Form submission
        document.getElementById('updateForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('loading');
            submitBtn.disabled = true;
            
            // Check if any changes were made
            let hasChanges = false;
            inputs.forEach(input => {
                if (input.value !== originalValues[input.name]) {
                    hasChanges = true;
                }
            });
            
            if (!hasChanges) {
                e.preventDefault();
                alert('No changes detected. Please modify at least one field before updating.');
                submitBtn.classList.remove('loading');
                submitBtn.disabled = false;
                return;
            }
        });

        // Email validation
        document.getElementById('email').addEventListener('blur', function() {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const formGroup = this.closest('.form-group');
            if (this.value && !emailRegex.test(this.value)) {
                formGroup.classList.add('error');
                formGroup.classList.remove('success');
            }
        });

        // Phone number formatting
        document.getElementById('number').addEventListener('input', function() {
            this.value = this.value.replace(/[^\d+\-\s()]/g, '');
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', function(e) {
            if (e.ctrlKey && e.key === 's') {
                e.preventDefault();
                document.getElementById('updateForm').dispatchEvent(new Event('submit'));
            }
            if (e.key === 'Escape') {
                history.back();
            }
        });
    </script>
</body>
</html>