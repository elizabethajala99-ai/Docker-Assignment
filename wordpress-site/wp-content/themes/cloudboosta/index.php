<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cloudboosta - Leading Cloud Services</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
        }
        
        .hero {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }
        
        .hero-content {
            max-width: 800px;
            animation: fadeInUp 1s ease-out;
        }
        
        .hero h1 {
            font-size: 3.5rem;
            font-weight: bold;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }
        
        .cta-button {
            display: inline-block;
            background: #ff6b6b;
            color: white;
            padding: 15px 40px;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
        }
        
        .cta-button:hover {
            background: #ff5252;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(255, 107, 107, 0.6);
        }
        
        .features {
            padding: 80px 20px;
            background: #f8f9fa;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .features h2 {
            text-align: center;
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: #333;
        }
        
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }
        
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
        }
        
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 2rem;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            .hero p {
                font-size: 1.1rem;
            }
        }
    </style>
    <?php wp_head(); ?>
</head>
<body <?php body_class(); ?>>

<div class="hero">
    <div class="hero-content">
        <h1>Welcome to Cloudboosta</h1>
        <p>Your Leading Cloud Service Provider</p>
        <p>Empowering businesses with scalable, secure, and reliable cloud solutions. Deploy faster, scale smarter, and innovate without limits.</p>
        <a href="#features" class="cta-button">Explore Our Services</a>
    </div>
</div>

<section id="features" class="features">
    <div class="container">
        <h2>Why Choose Cloudboosta?</h2>
        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">☁️</div>
                <h3>Cloud Infrastructure</h3>
                <p>Scalable and reliable cloud infrastructure solutions tailored to your business needs.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🚀</div>
                <h3>Fast Deployment</h3>
                <p>Deploy your applications quickly with our containerized solutions and CI/CD pipelines.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🔒</div>
                <h3>Enterprise Security</h3>
                <p>Bank-grade security with advanced encryption, monitoring, and compliance features.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <h3>Analytics & Monitoring</h3>
                <p>Real-time insights and comprehensive monitoring to optimize your cloud performance.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🛠️</div>
                <h3>DevOps Solutions</h3>
                <p>Complete DevOps toolkit including Docker, Kubernetes, and automated deployment pipelines.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🌍</div>
                <h3>Global Reach</h3>
                <p>Worldwide data centers ensuring low latency and high availability for your users.</p>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="container">
        <p>&copy; <?php echo date('Y'); ?> Cloudboosta. All rights reserved. | Containerized with Docker & WordPress</p>
    </div>
</footer>

<?php wp_footer(); ?>
</body>
</html>