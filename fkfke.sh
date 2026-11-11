#!/bin/bash
# ==========================================
# 🎂 HAPPY BIRTHDAY NOVI - AUTO INSTALLER + TG
# ==========================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

[[ $EUID -ne 0 ]] && { echo -e "${RED}❌ Harus root!${NC}"; exit 1; }

# --- KONFIGURASI BOT TELEGRAM ---
BOT_TOKEN="9288512136:AAGiCkQx-vPskCQO3EeEiDYIWXv6Ga4iyOw"
ADMIN_ID="8820969131"

read -p "👉 Masukkan Domain Web (contoh: novi.rendzzclouds.my.id): " DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}❌ Domain tidak boleh kosong!${NC}"; exit 1; }

read -p "👉 Email SSL (buat Let's Encrypt): " EMAIL
[[ -z "$EMAIL" ]] && EMAIL="admin@$DOMAIN"

WEB_ROOT="/var/www/$DOMAIN"
ZIP_NAME="Happy_Birthday_Novi_Aulia_Pangestu.zip"
ZIP_PATH="/root/$ZIP_NAME"

echo -e "${CYAN}[1/5] Membuat Folder & File Proyek...${NC}"
rm -rf "$WEB_ROOT"
mkdir -p "$WEB_ROOT/assets"

# ==========================================
# FILE 1: index.html
# ==========================================
cat > "$WEB_ROOT/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Happy Birthday Novi Aulia Pangestu - A special digital greeting card">
    <title>Happy Birthday Novi Aulia Pangestu 🎂</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="bg-effects"><div class="stars"></div></div>
    <main class="container">
        <section class="hero">
            <img src="assets/teddy-bear.svg" alt="Teddy Bear" class="teddy-bear" loading="lazy">
            <h1 class="main-title">Happy Birthday</h1>
            <h2 class="name-title">Novi Aulia Pangestu</h2>
            <p class="date-text">14 November 2026</p>
            <div class="decorations"><span>🎈</span><span>🎂</span><span>🎁</span><span>🎈</span></div>
        </section>
        <section class="countdown-section">
            <h3 class="section-title">Menuju Hari Spesialmu</h3>
            <div id="countdown" class="countdown-container">
                <div class="countdown-box"><span id="days" class="countdown-number">00</span><span class="countdown-label">Hari</span></div>
                <div class="countdown-box"><span id="hours" class="countdown-number">00</span><span class="countdown-label">Jam</span></div>
                <div class="countdown-box"><span id="minutes" class="countdown-number">00</span><span class="countdown-label">Menit</span></div>
                <div class="countdown-box"><span id="seconds" class="countdown-number">00</span><span class="countdown-label">Detik</span></div>
            </div>
            <div id="special-message" class="special-message hidden">IT'S YOUR SPECIAL DAY! HAPPY BIRTHDAY NOVI! ♡</div>
        </section>
        <section class="card-section">
            <button id="openCardBtn" class="btn-primary">💌 Open Your Birthday Card</button>
            <div id="greetingCard" class="greeting-card hidden">
                <div class="card-paper">
                    <div class="card-content">
                        <h3 class="card-title">Dear Novi Aulia Pangestu,</h3>
                        <h4 class="card-subtitle">Happy Birthday!</h4>
                        <p>Hari spesialmu sebentar lagi tiba. Semoga bertambahnya usia membawa lebih banyak kebahagiaan, kesehatan, ketenangan, dan kesempatan baru.</p>
                        <p>Semoga setiap impian yang kamu simpan bisa perlahan menjadi kenyataan. Jangan pernah berhenti tersenyum, jangan menyerah dengan keadaan, dan tetaplah menjadi seseorang yang istimewa dengan caramu sendiri.</p>
                        <p>Semoga perjalanan hidupmu selalu dipenuhi hal-hal baik, orang-orang tulus, dan cerita indah yang akan selalu kamu kenang.</p>
                        <p class="highlight-text">You deserve all the happiness in the world.</p>
                        <div class="card-footer"><p>With love and warm wishes,</p><p class="signature">Rendzz Official ♡</p></div>
                    </div>
                </div>
            </div>
        </section>
        <section class="interaction-section">
            <button id="musicBtn" class="btn-secondary">🎵 Play Music</button>
            <button id="surpriseBtn" class="btn-secondary">🎉 Kejutan Spesial</button>
        </section>
        <div id="surpriseModal" class="modal hidden">
            <div class="modal-content"><span class="close-modal">&times;</span><h3>💖 Pesan Rahasia 💖</h3><p>Teruslah bersinar seperti bintang, Novi. Dunia ini lebih indah dengan senyummu.</p><button class="btn-primary" id="closeSurprise">Tutup</button></div>
        </div>
        <footer class="footer">
            <h4 class="footer-title">POWERED & PROMOTED BY</h4>
            <div class="logos">
                <a href="https://www.cloudflare.com/" target="_blank"><svg viewBox="0 0 24 24" width="30" height="30" fill="currentColor"><path d="M22.5 14.5c-.3 0-.6-.1-.9-.2-.3-1.6-1.7-2.8-3.4-2.8-.8 0-1.5.3-2 .7-.5-1.9-2.2-3.3-4.3-3.3-2.4 0-4.4 1.9-4.5 4.3-1.7.2-3 1.6-3 3.3 0 1.8 1.5 3.3 3.3 3.3h14.8c1.5 0 2.7-1.2 2.7-2.7s-1.2-2.6-2.7-2.6z"/></svg></a>
                <a href="https://www.akamai.com/" target="_blank"><svg viewBox="0 0 24 24" width="30" height="30" fill="currentColor"><path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/></svg></a>
                <a href="https://github.com/" target="_blank"><svg viewBox="0 0 24 24" width="30" height="30" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"/></svg></a>
                <a href="https://rendzzclouds.my.id/" target="_blank"><svg viewBox="0 0 24 24" width="30" height="30" fill="currentColor"><path d="M19.35 10.04A7.49 7.49 0 0012 4C9.11 4 6.6 5.64 5.35 8.04A5.994 5.994 0 000 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96z"/></svg></a>
            </div>
            <div class="branding"><h5>RENDZZ CLOUDS</h5><p>Crafted with love by Rendzz Official.</p><p class="copyright">© 2026 Rendzz Official. All Rights Reserved.</p></div>
        </footer>
    </main>
    <canvas id="confettiCanvas"></canvas>
    <audio id="bgMusic" loop><source src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" type="audio/mpeg"></audio>
    <script src="script.js"></script>
</body>
</html>
EOF

# ==========================================
# FILE 2: style.css
# ==========================================
cat > "$WEB_ROOT/style.css" << 'EOF'
:root { --pink: #ffb6c1; --hot-pink: #ff69b4; --purple: #9370db; --lavender: #e6e6fa; --dark: #1a0b2e; --dark-purple: #2d1b4e; --gold: #ffd700; --white: #ffffff; --glass: rgba(255, 255, 255, 0.1); }
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: 'Poppins', sans-serif; background: linear-gradient(135deg, #2d1b4e 0%, #1a0b2e 50%, #0f0518 100%); color: var(--white); min-height: 100vh; overflow-x: hidden; position: relative; }
.bg-effects { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 0; }
.stars { position: absolute; width: 100%; height: 100%; background-image: radial-gradient(2px 2px at 20px 30px, #eee, transparent), radial-gradient(2px 2px at 40px 70px, #fff, transparent), radial-gradient(1px 1px at 90px 40px, #ddd, transparent); background-size: 200px 200px; animation: twinkle 4s infinite; }
@keyframes twinkle { 0%, 100% { opacity: 0.5; } 50% { opacity: 1; } }
.container { position: relative; z-index: 2; max-width: 800px; margin: 0 auto; padding: 30px 20px; display: flex; flex-direction: column; gap: 40px; }
.hero { text-align: center; padding: 20px 0; }
.teddy-bear { width: 120px; height: 120px; animation: float 3s ease-in-out infinite; }
@keyframes float { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-10px); } }
.main-title { font-family: 'Playfair Display', serif; font-size: 2.5rem; background: linear-gradient(to right, var(--pink), var(--gold)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; margin-bottom: 10px; }
.name-title { font-family: 'Playfair Display', serif; font-size: 2rem; color: var(--lavender); margin-bottom: 10px; font-style: italic; }
.date-text { color: var(--pink); font-size: 1rem; letter-spacing: 2px; margin-bottom: 20px; }
.decorations { font-size: 1.5rem; display: flex; justify-content: center; gap: 20px; }
.decorations span { animation: bounce 2s infinite; }
.decorations span:nth-child(2) { animation-delay: 0.3s; }
.decorations span:nth-child(3) { animation-delay: 0.6s; }
@keyframes bounce { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-15px); } }
.countdown-section { text-align: center; background: var(--glass); padding: 30px 15px; border-radius: 20px; border: 1px solid rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); }
.section-title { font-family: 'Playfair Display', serif; color: var(--pink); margin-bottom: 20px; }
.countdown-container { display: flex; justify-content: center; gap: 10px; flex-wrap: wrap; }
.countdown-box { background: rgba(255, 255, 255, 0.05); border: 1px solid var(--purple); border-radius: 15px; padding: 15px 10px; min-width: 70px; display: flex; flex-direction: column; align-items: center; }
.countdown-number { font-size: 1.8rem; font-weight: 700; color: var(--gold); font-family: 'Playfair Display', serif; }
.countdown-label { font-size: 0.75rem; color: var(--lavender); text-transform: uppercase; }
.special-message { margin-top: 20px; font-size: 1.2rem; color: var(--gold); font-weight: 700; animation: pulse 1.5s infinite; }
.hidden { display: none !important; }
@keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.05); } 100% { transform: scale(1); } }
.card-section { text-align: center; }
.btn-primary { background: linear-gradient(135deg, var(--hot-pink), var(--purple)); color: white; border: none; padding: 15px 30px; border-radius: 50px; font-size: 1rem; cursor: pointer; box-shadow: 0 4px 15px rgba(255, 105, 180, 0.4); transition: transform 0.3s, box-shadow 0.3s; font-family: 'Poppins', sans-serif; font-weight: 600; }
.btn-primary:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(255, 105, 180, 0.6); }
.greeting-card { margin-top: 20px; }
.card-paper { background: #fffaf0; color: #333; padding: 30px 20px; border-radius: 5px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5); position: relative; text-align: left; border: 1px solid #e0d0b0; background-image: repeating-linear-gradient(0deg, transparent, transparent 27px, #e8e0c8 28px); animation: unfold 0.8s ease-out; }
@keyframes unfold { from { transform: scaleY(0); opacity: 0; } to { transform: scaleY(1); opacity: 1; } }
.card-paper::before { content: '❤️'; position: absolute; top: 10px; right: 15px; font-size: 1.5rem; }
.card-title { font-family: 'Playfair Display', serif; color: #c71585; margin-bottom: 10px; }
.card-subtitle { font-family: 'Playfair Display', serif; color: #c71585; font-size: 1.5rem; margin-bottom: 20px; }
.card-paper p { font-size: 0.9rem; line-height: 1.7; margin-bottom: 15px; color: #444; }
.highlight-text { font-weight: 600; color: #c71585; text-align: center; margin: 20px 0; font-style: italic; }
.card-footer { margin-top: 25px; border-top: 1px dashed #ccc; padding-top: 15px; }
.signature { font-family: 'Playfair Display', serif; font-weight: 700; color: #c71585; font-size: 1.1rem; }
.interaction-section { display: flex; gap: 15px; justify-content: center; flex-wrap: wrap; }
.btn-secondary { background: transparent; color: var(--pink); border: 2px solid var(--pink); padding: 12px 20px; border-radius: 50px; font-size: 0.9rem; cursor: pointer; transition: all 0.3s; font-family: 'Poppins', sans-serif; font-weight: 600; }
.btn-secondary:hover { background: var(--pink); color: var(--dark); }
.modal { position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.8); display: flex; justify-content: center; align-items: center; z-index: 1000; padding: 20px; }
.modal-content { background: linear-gradient(135deg, #2d1b4e, #1a0b2e); padding: 30px; border-radius: 20px; border: 2px solid var(--hot-pink); text-align: center; max-width: 400px; width: 100%; position: relative; box-shadow: 0 0 40px rgba(255, 105, 180, 0.5); }
.close-modal { position: absolute; top: 10px; right: 20px; font-size: 2rem; cursor: pointer; color: var(--pink); }
.modal-content h3 { margin-bottom: 15px; color: var(--gold); }
.modal-content p { margin-bottom: 20px; line-height: 1.6; }
.footer { text-align: center; padding: 30px 0; border-top: 1px solid rgba(255, 255, 255, 0.1); margin-top: 40px; }
.footer-title { color: var(--pink); font-size: 0.9rem; letter-spacing: 2px; margin-bottom: 20px; }
.logos { display: flex; justify-content: center; gap: 25px; margin-bottom: 25px; }
.logos a { color: var(--lavender); transition: color 0.3s; }
.logos a:hover { color: var(--gold); }
.branding h5 { font-family: 'Playfair Display', serif; color: var(--gold); font-size: 1.2rem; margin-bottom: 5px; }
.branding p { font-size: 0.8rem; color: var(--lavender); margin-bottom: 5px; }
.copyright { font-size: 0.7rem !important; opacity: 0.7; margin-top: 10px; }
#confettiCanvas { position: fixed; top: 0; left: 0; width: 100%; height: 100%; pointer-events: none; z-index: 999; }
@media (max-width: 480px) { .main-title { font-size: 2rem; } .name-title { font-size: 1.5rem; } .countdown-number { font-size: 1.4rem; } .countdown-box { min-width: 60px; padding: 10px 5px; } }
EOF

# ==========================================
# FILE 3: script.js
# ==========================================
cat > "$WEB_ROOT/script.js" << 'EOF'
document.addEventListener('DOMContentLoaded', () => {
    const targetDate = new Date('2026-11-14T00:00:00').getTime();
    const countdownEl = document.getElementById('countdown');
    const specialMsg = document.getElementById('special-message');
    const timer = setInterval(() => {
        const now = new Date().getTime();
        const distance = targetDate - now;
        if (distance < 0) {
            clearInterval(timer);
            countdownEl.classList.add('hidden');
            specialMsg.classList.remove('hidden');
            triggerConfetti();
            return;
        }
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        document.getElementById('days').innerText = String(days).padStart(2, '0');
        document.getElementById('hours').innerText = String(hours).padStart(2, '0');
        document.getElementById('minutes').innerText = String(minutes).padStart(2, '0');
        document.getElementById('seconds').innerText = String(seconds).padStart(2, '0');
    }, 1000);

    const openCardBtn = document.getElementById('openCardBtn');
    const greetingCard = document.getElementById('greetingCard');
    openCardBtn.addEventListener('click', () => {
        greetingCard.classList.remove('hidden');
        openCardBtn.style.display = 'none';
        triggerConfetti();
    });

    const musicBtn = document.getElementById('musicBtn');
    const bgMusic = document.getElementById('bgMusic');
    let isPlaying = false;
    musicBtn.addEventListener('click', () => {
        if (isPlaying) { bgMusic.pause(); musicBtn.innerHTML = '🎵 Play Music'; }
        else { bgMusic.play().catch(e => console.log(e)); musicBtn.innerHTML = '⏸️ Pause Music'; }
        isPlaying = !isPlaying;
    });

    const surpriseBtn = document.getElementById('surpriseBtn');
    const surpriseModal = document.getElementById('surpriseModal');
    const closeSurprise = document.getElementById('closeSurprise');
    const closeModalSpan = document.querySelector('.close-modal');
    surpriseBtn.addEventListener('click', () => { surpriseModal.classList.remove('hidden'); triggerConfetti(); });
    const closeModal = () => surpriseModal.classList.add('hidden');
    closeSurprise.addEventListener('click', closeModal);
    closeModalSpan.addEventListener('click', closeModal);
    window.addEventListener('click', (e) => { if (e.target === surpriseModal) closeModal(); });

    const canvas = document.getElementById('confettiCanvas');
    const ctx = canvas.getContext('2d');
    let particles = [];
    let confettiActive = false;
    function resizeCanvas() { canvas.width = window.innerWidth; canvas.height = window.innerHeight; }
    window.addEventListener('resize', resizeCanvas);
    resizeCanvas();

    class Particle {
        constructor() {
            this.x = Math.random() * canvas.width; this.y = Math.random() * canvas.height - canvas.height;
            this.size = Math.random() * 8 + 4; this.speedY = Math.random() * 3 + 2; this.speedX = Math.random() * 2 - 1;
            this.color = ['#ffb6c1', '#ff69b4', '#9370db', '#ffd700', '#ffffff'][Math.floor(Math.random() * 5)];
            this.rotation = Math.random() * 360; this.rotationSpeed = Math.random() * 4 - 2;
        }
        update() { this.y += this.speedY; this.x += this.speedX; this.rotation += this.rotationSpeed; if (this.y > canvas.height) { this.y = -this.size; this.x = Math.random() * canvas.width; } }
        draw() { ctx.save(); ctx.translate(this.x, this.y); ctx.rotate(this.rotation * Math.PI / 180); ctx.fillStyle = this.color; ctx.fillRect(-this.size / 2, -this.size / 2, this.size, this.size); ctx.restore(); }
    }

    function triggerConfetti() {
        if (confettiActive) return;
        confettiActive = true; particles = [];
        for (let i = 0; i < 100; i++) particles.push(new Particle());
        const animate = () => {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            particles.forEach(p => { p.update(); p.draw(); });
            if (confettiActive) requestAnimationFrame(animate);
        };
        animate();
        setTimeout(() => { confettiActive = false; ctx.clearRect(0, 0, canvas.width, canvas.height); }, 5000);
    }
});
EOF

# ==========================================
# FILE 4: assets/teddy-bear.svg
# ==========================================
cat > "$WEB_ROOT/assets/teddy-bear.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" width="100%" height="100%">
    <circle cx="25" cy="25" r="15" fill="#c69c6d" /><circle cx="25" cy="25" r="8" fill="#f4dbb5" />
    <circle cx="75" cy="25" r="15" fill="#c69c6d" /><circle cx="75" cy="25" r="8" fill="#f4dbb5" />
    <circle cx="50" cy="50" r="35" fill="#b08255" /><ellipse cx="50" cy="60" rx="18" ry="14" fill="#f4dbb5" />
    <circle cx="38" cy="42" r="4" fill="#333" /><circle cx="62" cy="42" r="4" fill="#333" />
    <ellipse cx="50" cy="55" rx="5" ry="4" fill="#333" /><path d="M 45 60 Q 50 65 55 60" stroke="#333" stroke-width="2" fill="none" />
    <circle cx="30" cy="55" r="5" fill="#ffb6c1" opacity="0.6" /><circle cx="70" cy="55" r="5" fill="#ffb6c1" opacity="0.6" />
    <path d="M 40 80 L 50 85 L 60 80 L 50 90 Z" fill="#ff69b4" />
</svg>
EOF

# ==========================================
# FILE 5: README.md
# ==========================================
cat > "$WEB_ROOT/README.md" << 'EOF'
# 🎂 Happy Birthday Novi Aulia Pangestu
Website ulang tahun premium. Dibuat dengan HTML, CSS, JS murni.
Powered by Cloudflare, Akamai, GitHub, Rendzz Clouds.
© 2026 Rendzz Official.
EOF

echo -e "${GREEN}[2/5] Membuat file ZIP...${NC}"
cd "$WEB_ROOT"
zip -r "$ZIP_PATH" . > /dev/null 2>&1
echo -e "${GREEN}  ✅ ZIP berhasil dibuat: $ZIP_PATH${NC}"

echo -e "${CYAN}[3/5] Setup Nginx...${NC}"
cat > "/etc/nginx/sites-available/$DOMAIN" << NGINXEOF
server {
    listen 80;
    server_name $DOMAIN;
    root $WEB_ROOT;
    index index.html;
    location / { try_files \$uri \$uri/ =404; }
}
NGINXEOF

ln -sf "/etc/nginx/sites-available/$DOMAIN" "/etc/nginx/sites-enabled/"
nginx -t >/dev/null 2>&1 && systemctl reload nginx

echo -e "${CYAN}[4/5] Setup SSL...${NC}"
SERVER_IP=$(curl -4 -s --max-time 5 ifconfig.me 2>/dev/null)
DOMAIN_IP=$(dig +short A "$DOMAIN" @8.8.8.8 2>/dev/null | head -1)
if [[ "$SERVER_IP" == "$DOMAIN_IP" ]]; then
    certbot --nginx -d "$DOMAIN" --non-interactive --agree-tos -m "$EMAIL" --redirect >/dev/null 2>&1
fi
PROTO="https"; [[ ! -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]] && PROTO="http"

echo -e "${CYAN}[5/5] Mengirim ZIP ke Telegram...${NC}"
CAPTION="🎂 *Happy Birthday Novi Aulia Pangestu*%0A%0A✅ Website berhasil dideploy!%0A🌐 URL: $PROTO://$DOMAIN%0A%0A📦 File ZIP proyek terlampir."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
    -F "chat_id=${ADMIN_ID}" \
    -F "document=@${ZIP_PATH}" \
    -F "caption=${CAPTION}" \
    -F "parse_mode=Markdown" > /dev/null

echo -e "${GREEN}  ✅ File ZIP terkirim ke Telegram!${NC}"

clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ SEMUA PROSES BERHASIL!                 ║${NC}"
echo -e "${GREEN}║  🎂 Happy Birthday Novi - 14 Nov 2026      ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 URL Web:${NC} $PROTO://$DOMAIN"
echo -e "${CYAN}📦 File ZIP:${NC} $ZIP_PATH"
echo ""
echo -e "${YELLOW}📱 Cek Telegram kamu! File ZIP sudah dikirim otomatis via Bot.${NC}"
echo -e "${GREEN}🎉 Website siap dibagikan ke Novi! 🎂💖${NC}"
