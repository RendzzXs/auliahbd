#!/bin/bash
# ==========================================
# 🎂 HAPPY BIRTHDAY NOVI - v7.0 DUAL PHOTO
# Stack Photo • New Music • Full Update
# ==========================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

[[ $EUID -ne 0 ]] && { echo -e "${RED}❌ Harus root!${NC}"; exit 1; }

read -p "👉 Masukkan Domain Web (contoh: novi.rendzzclouds.my.id): " DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}❌ Domain tidak boleh kosong!${NC}"; exit 1; }

WEB_ROOT="/var/www/$DOMAIN"
ZIP_NAME="Happy_Birthday_Novi_v7.zip"
ZIP_PATH="/root/$ZIP_NAME"

# KONFIG BOT TELEGRAM
BOT_TOKEN="9288512136:AAGiCkQx-vPskCQO3EeEiDYIWXv6Ga4iyOw"
ADMIN_ID="8820969131"

if [ ! -d "$WEB_ROOT" ]; then
    echo -e "${RED}❌ Folder web tidak ditemukan! Pastikan domain benar.${NC}"; exit 1
fi

echo -e "${CYAN}[1/4] Download Assets Baru (Musik & 2 Foto)...${NC}"
mkdir -p "$WEB_ROOT/assets"
cd "$WEB_ROOT/assets"

# Download Lagu Baru
wget -q -O "lagu.mp3" "https://n.uguu.se/OfEumVjr.mp3"
if [ -s "lagu.mp3" ]; then echo -e "${GREEN}  ✅ Lagu Baru OK.${NC}"; fi

# Download Foto 1 (Yang tadi)
wget -q -O "foto1.jpeg" "https://d.uguu.se/HZFtvvEx.jpeg"
# Download Foto 2 (Baru)
wget -q -O "foto2.jpeg" "https://d.uguu.se/CnKQSDNY.jpeg"
echo -e "${GREEN}  ✅ 2 Foto berhasil disiapkan.${NC}"

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

        <!-- DUAL PHOTO STACK (KLIK UNTUK GANTI) -->
        <section class="photo-section">
            <p style="font-size: 0.8em; color: var(--text-muted); margin-bottom: 10px; text-align: center;"><i class="fas fa-hand-pointer"></i> Klik fotonya buat ganti!</p>
            <div class="photo-stack-wrapper">
                <div class="photo-stack" id="photoStack">
                    <div class="photo-card card-1">
                        <img src="assets/foto2.jpeg" alt="Novi Photo 2" class="photo-img" loading="lazy">
                        <div class="photo-caption">✨ Novi ✨</div>
                    </div>
                    <div class="photo-card card-2">
                        <img src="assets/foto1.jpeg" alt="Novi Photo 1" class="photo-img" loading="lazy">
                        <div class="photo-caption">✨ Aulia ✨</div>
                    </div>
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

echo -e "${CYAN}[3/4] Update CSS (Stack Photo)...${NC}"
# Hapus CSS Polaroid lama biar ga bentrok
sed -i '/\/\* FOTO CARD KECIL (POLAROID STYLE) \*\//,/\.photo-caption {/d' "$WEB_ROOT/style.css"

# Tambahin CSS Stack Photo yang baru
cat >> "$WEB_ROOT/style.css" << 'CSSEOF'

/* ==============================
   DUAL PHOTO STACK (KLIK GANTI)
   ============================== */
.photo-section {
    text-align: center;
    margin: 40px 0;
}
.photo-stack-wrapper {
    display: flex;
    justify-content: center;
    position: relative;
    height: 260px;
}
.photo-stack {
    position: relative;
    width: 180px;
    height: 220px;
    cursor: pointer;
}
.photo-card {
    position: absolute;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: #fff;
    padding: 10px 10px 35px 10px;
    border-radius: 5px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
    transition: transform 0.5s ease, z-index 0.5s;
    transform-origin: center bottom;
}
.photo-card.card-1 { z-index: 1; transform: rotate(-5deg) translateX(-10px); }
.photo-card.card-2 { z-index: 2; transform: rotate(5deg) translateX(10px); }

/* Efek pas di-klik (animasi tumpukan bergeser) */
.photo-stack:hover .card-1 { transform: rotate(-10deg) translateX(-20px); }
.photo-stack:hover .card-2 { transform: rotate(10deg) translateX(20px); }

.photo-img {
    width: 100%; height: 100%;
    object-fit: cover;
    border-radius: 3px;
    border: 1px solid #eee;
}
.photo-caption {
    position: absolute;
    bottom: 8px;
    left: 0; width: 100%;
    text-align: center;
    font-family: 'Playfair Display', serif;
    font-size: 0.85rem;
    color: #333;
    font-weight: 600;
}
CSSEOF

echo -e "${CYAN}[4/4] Update JS (Logika Ganti Foto) & Setup Nginx...${NC}"
# Append logika klik ganti foto di script.js
cat >> "$WEB_ROOT/script.js" << 'JSEOF'

// ==========================================
// LOGIKA GANTI FOTO (KLIK)
// ==========================================
document.addEventListener('DOMContentLoaded', () => {
    const stack = document.getElementById('photoStack');
    if(stack) {
        let isSwapped = false;
        stack.addEventListener('click', () => {
            const card1 = stack.querySelector('.card-1');
            const card2 = stack.querySelector('.card-2');
            if (!isSwapped) {
                card1.style.zIndex = '2';
                card1.style.transform = 'rotate(5deg) translateX(10px)';
                card2.style.zIndex = '1';
                card2.style.transform = 'rotate(-5deg) translateX(-10px)';
            } else {
                card1.style.zIndex = '1';
                card1.style.transform = 'rotate(-5deg) translateX(-10px)';
                card2.style.zIndex = '2';
                card2.style.transform = 'rotate(5deg) translateX(10px)';
            }
            isSwapped = !isSwapped;
            if (typeof triggerConfetti === 'function') triggerConfetti();
        });
    }
});
JSEOF

# Update Nginx Config (Biar /coba jalan)
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

CAPTION="🎂 *Happy Birthday Novi - v7.0 DUAL PHOTO*%0A%0A✅ 2 Foto (Klik Ganti)%0A✅ Lagu Baru%0A✅ Teks Luluh + /coba%0A%0A📦 ZIP terlampir."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
    -F "chat_id=${ADMIN_ID}" \
    -F "document=@${ZIP_PATH}" \
    -F "caption=${CAPTION}" \
    -F "parse_mode=Markdown" > /dev/null

clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ UPDATE v7.0 BERHASIL!                  ║${NC}"
echo -e "${GREEN}║  🖼️ 2 Foto (Stack) • 🎵 Lagu Baru          ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 Web Utama:${NC} https://$DOMAIN"
echo -e "${MAGENTA}🕵️‍♂️ Mode Simulasi:${NC} https://$DOMAIN/coba"
echo ""
echo -e "${YELLOW}💡 Tips: Klik tumpukan fotonya buat ganti urutan & munculin confetti!${NC}"
echo -e "${GREEN}🚀 Cek ZIP di Telegram & buka webnya! 🎂💖${NC}"
