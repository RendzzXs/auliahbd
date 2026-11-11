#!/bin/bash
# ==========================================
# 🎂 HAPPY BIRTHDAY NOVI - v6.0 FINAL
# Foto Baru • Teks Luluh • Fitur /coba
# ==========================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

[[ $EUID -ne 0 ]] && { echo -e "${RED}❌ Harus root!${NC}"; exit 1; }

read -p "👉 Masukkan Domain Web (contoh: novi.rendzzclouds.my.id): " DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}❌ Domain tidak boleh kosong!${NC}"; exit 1; }

WEB_ROOT="/var/www/$DOMAIN"
ZIP_NAME="Happy_Birthday_Novi_v6.zip"
ZIP_PATH="/root/$ZIP_NAME"

# KONFIG BOT TELEGRAM
BOT_TOKEN="9288512136:AAGiCkQx-vPskCQO3EeEiDYIWXv6Ga4iyOw"
ADMIN_ID="8820969131"

if [ ! -d "$WEB_ROOT" ]; then
    echo -e "${RED}❌ Folder web tidak ditemukan! Pastikan domain benar.${NC}"; exit 1
fi

echo -e "${CYAN}[1/4] Download Assets (Lagu & Foto Baru)...${NC}"
mkdir -p "$WEB_ROOT/assets"
cd "$WEB_ROOT/assets"

# Download Lagu
if [ ! -f "lagu.mp3" ]; then
    wget -q -O "lagu.mp3" "https://h.uguu.se/aEDONSMj.mp3"
fi
# Download Foto Baru
wget -q -O "foto-novi.jpeg" "https://d.uguu.se/HZFtvvEx.jpeg"
echo -e "${GREEN}  ✅ Assets Siap.${NC}"

echo -e "${CYAN}[2/4] Rebuild index.html...${NC}"
cat > "$WEB_ROOT/index.html" << 'EOF'
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Happy Birthday Novi Aulia Pangestu 🎂</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="bg-effects"><div class="stars"></div></div>
    <div id="floating-emojis"></div>

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
            
            <!-- TEKS LULUH BAPER MODE -->
            <div id="special-message" class="special-message hidden">
                <h2 style="font-size: 2rem; margin-bottom: 20px; color: var(--gold); text-shadow: 0 0 10px rgba(255,215,0,0.5);">IT'S YOUR SPECIAL DAY! HAPPY BIRTHDAY NOVI! ♡</h2>
                
                <p style="font-size: 1rem; line-height: 1.9; color: var(--lavender); margin-bottom: 20px;">
                    Selamat ulang tahun ya, <b style="color: #ffb6c1;">Novi Aulia Pangestu</b>. 🎂 Hari ini bumi berputar sedikit lebih meriah karena ada kamu di dalamnya. 
                    Terima kasih sudah bertahan sejauh ini, terima kasih sudah jadi Novi yang kuat, yang selalu bisa bikin orang di sekitarnya senyum, 
                    dan terima kasih sudah jadi dirimu sendiri. <b style="color: var(--hot-pink);">Kamu hebat, kamu berharga, dan kamu pantas mendapatkan semua hal baik di dunia ini.</b> 
                    Sehat terus, bahagia terus, dan jangan lupa makan siang yang teratur ya! 🥺💖
                </p>
                
                <p style="font-size: 1rem; line-height: 1.9; color: var(--lavender); margin-bottom: 20px;">
                    Semoga di umur baru ini, semua doa yang kamu simpan diam-diam bisa dikabulkan satu per satu. 
                    Semoga setiap langkahmu dipermudah, setiap impianmu didekatkan, dan setiap air mata yang jatuh diganti dengan kebahagiaan yang berlipat ganda. 
                    <b style="color: #ffd700;">Jangan pernah ragu sama kemampuan diri kamu sendiri, karena kamu jauh lebih kuat dari yang kamu kira.</b>
                </p>

                <p style="font-size: 1rem; line-height: 1.9; color: var(--lavender); margin-bottom: 20px;">
                    Eh tapi jangan nangis dulu ya... 🫣 Nanti mascara luntur, terus bingung kan? Wkwk. 
                    Pokoknya hari ini kamu ratu, kamu putri, kamu segalanya. Tapi besok balik lagi jadi manusia biasa yang harus bayar kos sendiri ya! 🤣 
                    Bercanda Novi... <b style="color: var(--hot-pink);">Sekali lagi, Happy Birthday! Aku sayang kamu, selalu.</b> Semoga panjang umur, murah rezeki, dan semoga kita bisa ketemu di versi terbaik masing-masing. Aamiin. 💖
                </p>
            </div>
        </section>

        <section id="wishes-section" class="wishes-section hidden">
            <h3 class="section-title">Ucapan Dari Mereka 💌</h3>
            <div class="wishes-container">
                <div class="wish-card"><p>"Selamat ulang tahun Novi! Semoga makin sholehah dan sukses selalu."</p><span>- And*</span></div>
                <div class="wish-card"><p>"Happy birthday Novi! Jangan lupa bahagia terus ya, jangan galau mulu wkwk."</p><span>- Ri*</span></div>
                <div class="wish-card"><p>"Barakallah fii umrik Novi. Semoga semua impianmu tercapai!"</p><span>- Bu D**</span></div>
                <div class="wish-card"><p>"Novi sayang, selamat ulang tahun! Makasih udah jadi temen yang baik."</p><span>- Si**</span></div>
                <div class="wish-card"><p>"Happy bday Novi! Semoga rezekinya dilancarkan, jodohnya dipercepat (aamiin)."</p><span>- Fa**</span></div>
                <div class="wish-card"><p>"Selamat bertambah usia Novi. Tetap jadi Novi yang ceria dan baik hati."</p><span>- De**</span></div>
            </div>
        </section>

        <!-- FOTO CARD KECIL -->
        <section class="photo-section">
            <div class="photo-card-wrapper">
                <div class="photo-card">
                    <img src="assets/foto-novi.jpeg" alt="Novi Aulia Pangestu" class="photo-img" loading="lazy" onerror="this.src='https://d.uguu.se/HZFtvvEx.jpeg'">
                    <div class="photo-caption">✨ Novi Aulia Pangestu ✨</div>
                </div>
            </div>
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
            <div class="modal-content"><span class="close-modal">&times;</span><h3>💖 Pesan Rahasia 💖</h3><p>Teruslah bersinar seperti bintang, Novi. Dunia ini lebih indah dengan senyummu. ✨</p><button class="btn-primary" id="closeSurprise">Tutup</button></div>
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
    
    <audio id="bgMusic" loop>
        <source src="assets/lagu.mp3" type="audio/mpeg">
    </audio>
    
    <div class="corner-bear">
        <img src="assets/teddy-bear.svg" alt="Bear">
        <span class="heart-float">💖</span>
    </div>

    <script src="script.js"></script>
</body>
</html>
EOF

echo -e "${CYAN}[3/4] Rebuild style.css & script.js...${NC}"
# Hapus CSS Slider Lama (jika ada)
sed -i '/\/\* PHOTO SLIDER \*\//,/\.slider-dots/d' "$WEB_ROOT/style.css"

# Tambahin CSS Polaroid & Animasi Teks
cat >> "$WEB_ROOT/style.css" << 'CSSEOF'

/* FOTO CARD KECIL (POLAROID STYLE) */
.photo-section { text-align: center; margin: 30px 0; }
.photo-card-wrapper { display: flex; justify-content: center; align-items: center; }
.photo-card {
    background: #fff; padding: 10px 10px 40px 10px; border-radius: 5px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4); transform: rotate(-3deg);
    transition: transform 0.3s; max-width: 200px; width: 100%; position: relative;
}
.photo-card:hover { transform: rotate(0deg) scale(1.05); }
.photo-img { width: 100%; height: auto; border-radius: 3px; display: block; object-fit: cover; border: 1px solid #eee; }
.photo-caption {
    position: absolute; bottom: 10px; left: 0; width: 100%; text-align: center;
    font-family: 'Playfair Display', serif; font-size: 0.9rem; color: #333; font-weight: 600;
}

/* ANIMASI FADE IN TEKS LULUH */
#special-message p { animation: fadeInUp 1.5s ease-out forwards; opacity: 0; }
#special-message p:nth-child(1) { animation-delay: 0.2s; }
#special-message p:nth-child(2) { animation-delay: 0.6s; }
#special-message p:nth-child(3) { animation-delay: 1s; }
@keyframes fadeInUp { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
CSSEOF

# Rebuild script.js (Logika Simulasi /coba)
cat > "$WEB_ROOT/script.js" << 'JSEOF'
document.addEventListener('DOMContentLoaded', () => {
    // 1. SIMULASI /COBA
    const isSimulation = window.location.pathname.includes('/coba');
    let targetDate = new Date('2026-11-14T00:00:00').getTime();
    if (isSimulation) {
        targetDate = new Date().getTime() - 1000; // Paksa jadi kemarin
        console.log("🚧 MODE SIMULASI AKTIF (/coba)");
    }

    const countdownEl = document.getElementById('countdown');
    const specialMsg = document.getElementById('special-message');
    const wishesSection = document.getElementById('wishes-section');

    function showHariH() {
        if (countdownEl) countdownEl.classList.add('hidden');
        if (specialMsg) specialMsg.classList.remove('hidden');
        if (wishesSection) wishesSection.classList.remove('hidden');
        if (typeof triggerConfetti === 'function') triggerConfetti();
    }

    const timer = setInterval(() => {
        const now = new Date().getTime();
        const distance = targetDate - now;
        if (distance < 0) {
            clearInterval(timer);
            showHariH();
            return;
        }
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        if(document.getElementById('days')) document.getElementById('days').innerText = String(days).padStart(2, '0');
        if(document.getElementById('hours')) document.getElementById('hours').innerText = String(hours).padStart(2, '0');
        if(document.getElementById('minutes')) document.getElementById('minutes').innerText = String(minutes).padStart(2, '0');
        if(document.getElementById('seconds')) document.getElementById('seconds').innerText = String(seconds).padStart(2, '0');
    }, 1000);

    // 2. SLIDER (Mungkin masih dipake di kode lama, biarin aja)
    let currentSlide = 0;
    const slides = document.querySelectorAll('.slide-img');
    const dots = document.querySelectorAll('.dot');
    function showSlide(index) {
        if (slides.length === 0) return;
        slides.forEach((slide, i) => { slide.classList.remove('active'); if (dots[i]) dots[i].classList.remove('active'); });
        currentSlide = (index + slides.length) % slides.length;
        slides[currentSlide].classList.add('active'); if (dots[currentSlide]) dots[currentSlide].classList.add('active');
    }
    function goToSlide(index) { showSlide(index); resetAutoSlide(); }
    function nextSlide() { showSlide(currentSlide + 1); }
    let autoSlideInterval;
    function startAutoSlide() { autoSlideInterval = setInterval(nextSlide, 4000); }
    function resetAutoSlide() { clearInterval(autoSlideInterval); startAutoSlide(); }
    if (slides.length > 0) startAutoSlide();

    // 3. TOMBOL OPEN CARD
    const openCardBtn = document.getElementById('openCardBtn');
    if(openCardBtn) {
        openCardBtn.addEventListener('click', () => {
            document.getElementById('greetingCard').classList.remove('hidden');
            openCardBtn.style.display = 'none';
            if (typeof triggerConfetti === 'function') triggerConfetti();
        });
    }

    // 4. MUSIC
    const musicBtn = document.getElementById('musicBtn');
    const bgMusic = document.getElementById('bgMusic');
    let isPlaying = false;
    if(musicBtn) {
        musicBtn.addEventListener('click', () => {
            if (isPlaying) { bgMusic.pause(); musicBtn.innerHTML = '🎵 Play Music'; }
            else { bgMusic.play().catch(e => console.log(e)); musicBtn.innerHTML = '⏸️ Pause Music'; }
            isPlaying = !isPlaying;
        });
    }

    // 5. SURPRISE MODAL
    const surpriseBtn = document.getElementById('surpriseBtn');
    const surpriseModal = document.getElementById('surpriseModal');
    if(surpriseBtn) {
        surpriseBtn.addEventListener('click', () => { surpriseModal.classList.remove('hidden'); if (typeof triggerConfetti === 'function') triggerConfetti(); });
    }
    const closeModal = () => { if(surpriseModal) surpriseModal.classList.add('hidden'); };
    if(document.getElementById('closeSurprise')) document.getElementById('closeSurprise').addEventListener('click', closeModal);
    if(document.querySelector('.close-modal')) document.querySelector('.close-modal').addEventListener('click', closeModal);
    window.addEventListener('click', (e) => { if (e.target === surpriseModal) closeModal(); });

    // 6. CONFETTI
    const canvas = document.getElementById('confettiCanvas');
    if(canvas) {
        const ctx = canvas.getContext('2d');
        let particles = [];
        let confettiActive = false;
        function resizeCanvas() { canvas.width = window.innerWidth; canvas.height = window.innerHeight; }
        window.addEventListener('resize', resizeCanvas); resizeCanvas();

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
        window.triggerConfetti = function() {
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
        };
    }

    // 7. FLOATING EMOJIS (RAHASIA)
    const emojiList = ['🧸', '💖', '🌸', '✨', '🎈', '🎀', '💕'];
    const floatingContainer = document.getElementById('floating-emojis');
    if(floatingContainer) {
        setInterval(() => {
            const emoji = document.createElement('div');
            emoji.className = 'floating-icon';
            emoji.innerText = emojiList[Math.floor(Math.random() * emojiList.length)];
            emoji.style.left = Math.random() * 100 + 'vw';
            const duration = Math.random() * 5 + 5;
            emoji.style.animationDuration = duration + 's';
            emoji.style.fontSize = (Math.random() * 1 + 1) + 'rem';
            floatingContainer.appendChild(emoji);
            setTimeout(() => { emoji.remove(); }, duration * 1000);
        }, 800);
    }
});
JSEOF

echo -e "${CYAN}[4/4] Setup Nginx (/coba) & Kirim ZIP...${NC}"
# Update Nginx biar /coba tetep buka index.html
if [ -f "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" ]; then
    cat > "/etc/nginx/sites-available/$DOMAIN" << NGINXEOF
server {
    listen 80;
    server_name $DOMAIN;
    return 301 https://\$host\$request_uri;
}
server {
    listen 443 ssl http2;
    server_name $DOMAIN;
    root $WEB_ROOT;
    index index.html;
    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

    location /coba { try_files /index.html =404; }
    location / { try_files \$uri \$uri/ =404; }
}
NGINXEOF
else
    cat > "/etc/nginx/sites-available/$DOMAIN" << NGINXEOF
server {
    listen 80;
    server_name $DOMAIN;
    root $WEB_ROOT;
    index index.html;
    location /coba { try_files /index.html =404; }
    location / { try_files \$uri \$uri/ =404; }
}
NGINXEOF
fi

nginx -t >/dev/null 2>&1 && systemctl reload nginx

cd "$WEB_ROOT"
zip -r "$ZIP_PATH" . > /dev/null 2>&1

CAPTION="🎂 *Happy Birthday Novi - v6.0 FINAL*%0A%0A✅ Foto Baru%0A✅ Teks Luluh Bold%0A✅ Fitur Rahasia /coba%0A%0A📦 ZIP terlampir."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
    -F "chat_id=${ADMIN_ID}" \
    -F "document=@${ZIP_PATH}" \
    -F "caption=${CAPTION}" \
    -F "parse_mode=Markdown" > /dev/null

clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ UPDATE v6.0 BERHASIL!                  ║${NC}"
echo -e "${GREEN}║  📸 Foto Baru • 💌 Teks Luluh • 🚧 /coba   ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 Web Utama:${NC} https://$DOMAIN"
echo -e "${MAGENTA}🕵️‍♂️ Mode Simulasi (Rahasia):${NC} https://$DOMAIN/coba"
echo ""
echo -e "${YELLOW}⚠️  Jangan kasih tau link /coba ke Novi!${NC}"
echo -e "${GREEN}🚀 Coba buka link /coba buat test teks barunya! 🎂💖${NC}"
