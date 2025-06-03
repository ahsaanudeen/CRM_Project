<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lead Management Form</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h1 {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-header p {
            color: #666;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
            font-size: 14px;
            transform: translateY(0);
            transition: all 0.3s ease;
        }

        .form-group input[type="text"] {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            background: #fff;
            color: #333;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-group input[type="text"]:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .form-group input[type="text"]:hover {
            border-color: #c1c7d0;
        }

        .submit-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 600px) {
            .form-container {
                padding: 30px 20px;
                margin: 10px;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }
            
            .form-header h1 {
                font-size: 24px;
            }
        }

        .icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 18px;
            pointer-events: none;
        }

        .form-group.has-icon input {
            padding-right: 50px;
        }

        /* Floating label effect */
        .form-group.floating {
            position: relative;
        }

        .form-group.floating label {
            position: absolute;
            left: 20px;
            top: 18px;
            background: white;
            padding: 0 8px;
            color: #999;
            pointer-events: none;
            z-index: 1;
        }

        .form-group.floating input:focus + label,
        .form-group.floating input:not(:placeholder-shown) + label {
            top: -8px;
            font-size: 12px;
            color: #667eea;
            font-weight: 600;
        }

        /* Loading animation for submit button */
        .submit-btn.loading {
            position: relative;
            color: transparent;
        }

        .submit-btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            margin: -10px 0 0 -10px;
            border: 2px solid transparent;
            border-top: 2px solid #fff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="form-header">
            <h1>Lead Information</h1>
            <p>Please fill in all the required details</p>
        </div>
        
        <form action="/admin/leads/save" method="post" id="leadForm">
            <div class="form-group floating">
                <input type="text" name="name" id="name" placeholder=" " required>
                <label for="name">Full Name</label>
            </div>
            
            <div class="form-row">
                <div class="form-group floating">
                    <input type="text" name="number" id="number" placeholder=" " required>
                    <label for="number">Contact Number</label>
                </div>
                
                <div class="form-group floating">
                    <input type="text" name="email" id="email" placeholder=" " required>
                    <label for="email">Email Address</label>
                </div>
            </div>
            
            <div class="form-group floating">
                <input type="text" name="stage" id="stage" placeholder=" " required>
                <label for="stage">Current Stage</label>
            </div>
            
            <div class="form-row">
                <div class="form-group floating">
                    <input type="text" name="degree" id="degree" placeholder=" " required>
                    <label for="degree">Degree</label>
                </div>
                
                <div class="form-group floating">
                    <input type="text" name="college" id="college" placeholder=" " required>
                    <label for="college">College/University</label>
                </div>
            </div>
            
            <input type="submit" value="Save Lead Information" class="submit-btn" id="submitBtn">
        </form>
    </div>

    <script>
        // Add form validation and loading state
        document.getElementById('leadForm').addEventListener('submit', function(e) {
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('loading');
            submitBtn.disabled = true;
            
            // Simulate form processing (remove this in production)
            // setTimeout(() => {
            //     submitBtn.classList.remove('loading');
            //     submitBtn.disabled = false;
            // }, 2000);
        });

        // Add input validation
        const inputs = document.querySelectorAll('input[type="text"]');
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.value.trim() === '') {
                    this.style.borderColor = '#ff6b6b';
                } else {
                    this.style.borderColor = '#e1e5e9';
                }
            });
            
            input.addEventListener('focus', function() {
                this.style.borderColor = '#667eea';
            });
        });

        // Email validation
        document.getElementById('email').addEventListener('blur', function() {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (this.value && !emailRegex.test(this.value)) {
                this.style.borderColor = '#ff6b6b';
            }
        });

        // Phone number formatting (basic)
        document.getElementById('number').addEventListener('input', function() {
            // Remove non-numeric characters except + and -
            this.value = this.value.replace(/[^\d+\-\s()]/g, '');
        });
    </script>
</body>
</html>