<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Mehrab | Portfolio</title>
  <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <style>
    * {
      box-sizing: border-box;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      font-family: 'SF Pro Display', sans-serif;
      margin: 0;
      padding: 0;
      color: #e0e0e0;
      position: relative;
      overflow-x: hidden;
    }

    /* Animated Background */
    body::before {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(45deg, #1a1a1a, #6200ea, #008bb5, #00d4ff);
      background-size: 400%;
      animation: gradientShift 15s ease-in-out infinite;
      z-index: -2;
    }

    body::after {
      content: '';
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: radial-gradient(circle, rgba(255, 255, 255, 0.05) 2%, transparent 3%);
      background-size: 100px 100px;
      opacity: 0.3;
      animation: particleFade 10s ease-in-out infinite;
      z-index: -1;
    }

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    @keyframes particleFade {
      0%, 100% { opacity: 0.3; }
      50% { opacity: 0.5; }
    }

    /* Navigation */
    nav {
      position: fixed;
      top: 0;
      width: 100%;
      background: rgba(26, 26, 26, 0.9);
      backdrop-filter: blur(12px);
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 15px 40px;
      z-index: 1000;
    }

    .logo {
      font-size: 26px;
      font-weight: 700;
      color: #00d4ff;
      animation: glow 2s ease-in-out infinite;
    }

    .nav-links {
      display: flex;
      gap: 30px;
    }

    .nav-links a {
      color: #00d4ff;
      text-decoration: none;
      font-weight: 600;
      font-size: 16px;
      position: relative;
      animation: pulse 3s ease-in-out infinite;
    }

    .nav-links a::after {
      content: '';
      position: absolute;
      width: 0;
      height: 2px;
      bottom: -5px;
      left: 0;
      background: #00d4ff;
      transition: width 0.3s ease;
    }

    .nav-links a:hover::after {
      width: 100%;
    }

    .hamburger {
      display: none;
      font-size: 24px;
      color: #00d4ff;
      cursor: pointer;
    }

    /* Animations */
    @keyframes glow {
      0%, 100% { text-shadow: 0 0 10px #00d4ff, 0 0 20px #00d4ff; }
      50% { text-shadow: 0 0 20px #00d4ff, 0 0 30px #00d4ff; }
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.05); }
    }

    @keyframes float {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-10px); }
    }

    @keyframes borderGlow {
      0% { box-shadow: 0 0 15px #00d4ff, 0 0 30px #6200ea; }
      50% { box-shadow: 0 0 25px #00d4ff, 0 0 40px #6200ea; }
      100% { box-shadow: 0 0 15px #00d4ff, 0 0 30px #6200ea; }
    }

    @keyframes bounce {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-5px); }
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    @keyframes draw {
      0% { stroke-dashoffset: 100; }
      50% { stroke-dashoffset: 0; }
      100% { stroke-dashoffset: 100; }
    }

    @keyframes rotateChart {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }

    @keyframes nodePulse {
      0%, 100% { r: 3; opacity: 0.7; }
      50% { r: 5; opacity: 1; }
    }

    @keyframes lineDraw {
      0% { stroke-dashoffset: 100; opacity: 0.3; }
      50% { stroke-dashoffset: 0; opacity: 0.8; }
      100% { stroke-dashoffset: 100; opacity: 0.3; }
    }

    @keyframes barGrow {
      0%, 100% { transform: scaleY(0.3); }
      50% { transform: scaleY(1); }
    }

    @keyframes oscillate {
      0%, 100% { transform: translateY(0); }
      50% { transform: translateY(-5px); }
    }

    /* Sections */
    section {
      min-height: 100vh;
      padding: 120px 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      z-index: 1;
    }

    .box {
      background: rgba(44, 44, 46, 0.95);
      padding: 50px;
      border-radius: 30px;
      box-shadow: 0 0 40px rgba(0, 212, 255, 0.3);
      width: 90%;
      max-width: 800px;
      text-align: center;
      animation: float 4s ease-in-out infinite;
    }

    h1, h2, h3 {
      color: #00d4ff;
      margin-bottom: 20px;
    }

    p {
      color: #e0e0e0;
      line-height: 1.6;
      font-size: 16px;
    }

    /* Network Diagram (Home Section) */
    .network-diagram {
      margin-top: 30px;
      text-align: center;
    }

    .network-diagram h3 {
      font-size: 20px;
    }

    .network-svg {
      width: 250px;
      height: 250px;
      margin: 0 auto;
      animation: rotateChart 25s linear infinite;
    }

    .network-svg line {
      stroke: #6200ea;
      stroke-width: 2;
      stroke-dasharray: 100;
      animation: lineDraw 5s ease-in-out infinite;
    }

    .network-svg circle {
      fill: #00d4ff;
      animation: nodePulse 3s ease-in-out infinite;
    }

    .network-legend {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
      margin-top: 20px;
    }

    .legend-item {
      display: flex;
      align-items: center;
      font-size: 14px;
      color: #e0e0e0;
    }

    .legend-color {
      width: 12px;
      height: 12px;
      border-radius: 3px;
      margin-right: 8px;
    }

    /* About Section */
    .about-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 20px;
    }

    .about-image {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      border: 5px solid #00d4ff;
      animation: borderGlow 3s ease-in-out infinite;
    }

    .about-name {
      font-size: 28px;
      font-weight: 700;
      color: #00d4ff;
    }

    .about-title {
      font-size: 18px;
      color: #e0e0e0;
    }

    .about-description {
      font-size: 16px;
      color: #e0e0e0;
      line-height: 1.6;
      background: rgba(60, 60, 62, 0.9);
      padding: 20px;
      border-radius: 15px;
    }

    /* Pie Chart (About Section) */
    .skills-chart {
      margin-top: 30px;
      text-align: center;
    }

    .skills-chart h3 {
      font-size: 20px;
    }

    .pie-chart {
      width: 200px;
      height: 200px;
      margin: 0 auto;
      animation: rotateChart 20s linear infinite;
    }

    .pie-chart circle {
      fill: none;
      stroke-width: 32;
      stroke-linecap: round;
      transform: rotate(-90deg);
      transform-origin: center;
    }

    .pie-chart circle:nth-child(1) {
      stroke: #00d4ff;
      stroke-dasharray: 100;
      animation: draw 4s ease-in-out infinite;
    }

    .pie-chart circle:nth-child(2) {
      stroke: #6200ea;
      stroke-dasharray: 80;
      animation: draw 4.5s ease-in-out infinite 0.5s;
    }

    .pie-chart circle:nth-child(3) {
      stroke: #b388ff;
      stroke-dasharray: 60;
      animation: draw 5s ease-in-out infinite 1s;
    }

    .skills-legend {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
      margin-top: 20px;
    }

    /* Histogram (Contact Section) */
    .contact-histogram {
      margin-top: 30px;
      text-align: center;
    }

    .contact-histogram h3 {
      font-size: 20px;
    }

    .histogram-svg {
      width: 250px;
      height: 150px;
      margin: 0 auto;
      animation: oscillate 6s ease-in-out infinite;
    }

    .histogram-svg rect {
      fill: none;
      stroke-width: 2;
      stroke-linecap: round;
      transform-origin: bottom;
    }

    .histogram-svg rect:nth-child(1) {
      stroke: #00d4ff;
      animation: barGrow 3s ease-in-out infinite;
    }

    .histogram-svg rect:nth-child(2) {
      stroke: #6200ea;
      animation: barGrow 3.5s ease-in-out infinite 0.3s;
    }

    .histogram-svg rect:nth-child(3) {
      stroke: #b388ff;
      animation: barGrow 4s ease-in-out infinite 0.6s;
    }

    .histogram-svg text {
      fill: #e0e0e0;
      font-size: 10px;
      text-anchor: middle;
    }

    .histogram-legend {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 15px;
      margin-top: 20px;
    }

    /* Contact Section */
    .contact-info {
      font-size: 16px;
      color: #00d4ff;
      background: rgba(60, 60, 62, 0.9);
      padding: 25px;
      border-radius: 15px;
      margin-top: 20px;
    }

    .social-links {
      margin-top: 20px;
      display: flex;
      justify-content: center;
      gap: 20px;
    }

    .social-links a {
      color: #00d4ff;
      font-size: 24px;
      animation: pulse 2s ease-in-out infinite;
    }

    .social-links a:hover {
      animation: bounce 0.5s ease-in-out;
    }

    /* Back to Top Button */
    .back-to-top {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #00d4ff;
      color: #1a1a1a;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      transition: opacity 0.3s ease;
      z-index: 1000;
    }

    .back-to-top i {
      animation: spin 2s linear infinite;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      nav {
        padding: 15px 20px;
      }

      .nav-links {
        display: none;
        flex-direction: column;
        position: absolute;
        top: 70px;
        left: 0;
        width: 100%;
        background: rgba(26, 26, 26, 0.95);
        padding: 20px;
        text-align: center;
      }

      .nav-links.active {
        display: flex;
      }

      .hamburger {
        display: block;
      }

      .box {
        padding: 30px;
      }

      .about-image {
        width: 120px;
        height: 120px;
      }

      .pie-chart {
        width: 150px;
        height: 150px;
      }

      .network-svg {
        width: 200px;
        height: 200px;
      }

      .histogram-svg {
        width: 200px;
        height: 120px;
      }
    }
  </style>
</head>
<body>
  <!-- Navigation -->
  <nav aria-label="Main navigation">
    <div class="logo">Mehrab</div>
    <div class="nav-links" id="nav-links">
      <a href="#home">Home</a>
      <a href="#about">About</a>
      <a href="#contact">Contact</a>
    </div>
    <div class="hamburger" id="hamburger" aria-label="Toggle menu">
      <i class="fas fa-bars"></i>
    </div>
  </nav>

  <!-- Home Section -->
  <section id="home" aria-labelledby="home-heading">
    <div class="box">
      <h1 id="home-heading">Welcome!</h1>
      <p>I’m Md. Mehrab Hossain — a student, learner, and aspiring CEO with a passion for innovation.</p>
      <div class="network-diagram">
        <h3>My Network</h3>
        <svg class="network-svg" viewBox="0 0 100 100" role="img" aria-label="Network diagram of skills and connections">
          <circle cx="50" cy="20" r="3" />
          <circle cx="80" cy="40" r="3" />
          <circle cx="70" cy="70" r="3" />
          <circle cx="30" cy="60" r="3" />
          <circle cx="20" cy="30" r="3" />
          <line x1="50" y1="20" x2="80" y2="40" />
          <line x1="80" y1="40" x2="70" y2="70" />
          <line x1="70" y1="70" x2="30" y2="60" />
          <line x1="30" y1="60" x2="20" y2="30" />
          <line x1="20" y1="30" x2="50" y2="20" />
          <line x1="50" y1="20" x2="70" y2="70" />
        </svg>
        <div class="network-legend">
          <div class="legend-item">
            <span class="legend-color" style="background: #00d4ff;"></span> Innovation
          </div>
          <div class="legend-item">
            <span class="legend-color" style="background: #6200ea;"></span> Connections
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- About Section -->
  <section id="about" aria-labelledby="about-heading">
    <div class="box">
      <h2 id="about-heading">About Me</h2>
      <div class="about-container">
        <img class="about-image" src="https://media-hosting.imagekit.io/9a039e0f9fb54cd0/images.jpeg?Expires=1841385322&Key-Pair-Id=K2ZIVPTIP2VGHC&Signature=b9SCI6XXoSVNyMcKbAhklXHbbtW4XI4lqBJ1U5Qs1L9kmO7uGsPiHp1EFRMrGdgkz63VYdqaGI10VwB4~Shuv2wHo8T5lVhsv0OtxPMYKDl-T6ENSrCZ8Aax9SLRvAFdMxyz-zgjr9rB-~RvccYkvP9uvOo2GtQi~8dykVTkCSxDlssBScJe6u2BQMPOwx99CxuC0insXlSwS8RPrykK5HnaxACj5n9lerQRAApW9TMNRtZqhgtK6cc2Zp9x727od4XVuJRTP0PBeqFQSGWbCqhLr44iRlyfjqEiTM6tMSwpt2Jjm9ivQY-KnvtykJVNF2lya61wqStx-ttsoFbQDA__" alt="Mehrab Hossain" />
        <div class="about-name">Md. Mehrab Hossain</div>
        <div class="about-title">Student | a creator| a editor </div>
        <div class="about-description">
          I’m from Jessore, Bangladesh. I dream of becoming a scientist and CEO, solving real-world problems with creativity, code, and passion.
        </div>
        <div class="skills-chart">
          <h3>My Skills</h3>
          <svg class="pie-chart" viewBox="0 0 64 64" role="img" aria-label="Skills distribution pie chart">
            <circle cx="32" cy="32" r="16" />
            <circle cx="32" cy="32" r="16" />
            <circle cx="32" cy="32" r="16" />
          </svg>
          <div class="skills-legend">
            <div class="legend-item木">
              <span class="legend-color" style="background: #00d4ff;"></span> Problem Solving (40%)
            </div>
            <div class="legend-item">
              <span class="legend-color" style="background: #6200ea;"></span> Coding (30%)
            </div>
            <div class="legend-item">
              <span class="legend-color" style="background: #b388ff;"></span> Leadership (20%)
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section id="contact" aria-labelledby="contact-heading">
    <div class="box">
      <h2 id="contact-heading">Contact Me</h2>
      <div class="contact-info">
        Email: <a href="mailto: hossainmehrab715@gmail.com" style="color: #00d4ff;">hossainmehrab715@gmail.com</a> <br>
        Phone: <a href="tel:+8801732600622" style="color: #00d4ff;">+8801732600622</a>
      </div>
      <div class="social-links">
        <a href="https://twitter.com" target="_blank" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
        <a href="https://linkedin.com" target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin"></i></a>
        <a href="https://github.com" target="_blank" aria-label="GitHub"><i class="fab fa-github"></i></a>
      </div>
      <div class="contact-histogram">
        <h3>Contact Channels</h3>
        <svg class="histogram-svg" viewBox="0 0 120 100" role="img" aria-label="Histogram of contact channel preferences">
          <rect x="20" y="20" width="20" height="60" rx="4" />
          <rect x="50" y="30" width="20" height="50" rx="4" />
          <rect x="80" y="40" width="20" height="40" rx="4" />
          <text x="30" y="95">Email</text>
          <text x="60" y="95">Phone</text>
          <text x="90" y="95">Social</text>
        </svg>
        <div class="histogram-legend">
          <div class="legend-item">
            <span class="legend-color" style="background: #00d4ff;"></span> Email (High)
          </div>
          <div class="legend-item">
            <span class="legend-color" style="background: #6200ea;"></span> Phone (Medium)
          </div>
          <div class="legend-item">
            <span class="legend-color" style="background: #b388ff;"></span> Social Media (Low)
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Back to Top Button -->
  <a href="#home" class="back-to-top" aria-label="Back to top">
    <i class="fas fa-chevron-up"></i>
  </a>

  <script>
    // Hamburger Menu Toggle
    const hamburger = document.getElementById("hamburger");
    const navLinks = document.getElementById("nav-links");

    hamburger.addEventListener("click", () => {
      navLinks.classList.toggle("active");
      hamburger.querySelector("i").classList.toggle("fa-bars");
      hamburger.querySelector("i").classList.toggle("fa-times");
    });

    // Close mobile menu when a link is clicked
    navLinks.querySelectorAll("a").forEach(link => {
      link.addEventListener("click", () => {
        navLinks.classList.remove("active");
        hamburger.querySelector("i").classList.add("fa-bars");
        hamburger.querySelector("i").classList.remove("fa-times");
      });
    });

    // Back to Top Button Visibility
    const backToTop = document.querySelector(".back-to-top");
    window.addEventListener("scroll", () => {
      backToTop.style.opacity = window.scrollY > 300 ? 1 : 0;
    });
  </script>
</body>
</html>
