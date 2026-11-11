#!/bin/bash
# ==========================================
# 🎂 HAPPY BIRTHDAY NOVI - v3.0 ROMANTIC
# Floating Icons • Corner Bear • Random Wishes
# ==========================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

[[ $EUID -ne 0 ]] && { echo -e "${RED}❌ Harus root!${NC}"; exit 1; }

read -p "👉 Masukkan Domain Web (contoh: novi.rendzzclouds.my.id): " DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}❌ Domain tidak boleh kosong!${NC}"; exit 1; }

WEB_ROOT="/var/www/$DOMAIN"
ZIP_NAME="Happy_Birthday_Novi_v3.zip"
ZIP_PATH="/root/$ZIP_NAME"

# KONFIG BOT TELEGRAM
BOT_TOKEN="9288512136:AAGiCkQx-vPskCQO3EeEiDYIWXv6Ga4iyOw"
ADMIN_ID="8820969131"

if [ ! -d "$WEB_ROOT" ]; then
    echo -e "${RED}❌ Folder web tidak ditemukan! Pastikan domain benar.${NC}"; exit 1
fi

echo -e "${CYAN}[1/4] Update HTML (Corner Bear & Random Wishes)...${NC}"

# --- RE-BUILD INDEX.HTML ---
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
    
    <!-- CONTAINER FLOATING EMOJI (Dibuat via JS) -->
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
                <h2 style="font-size: 1.8rem; margin-bottom: 15px; color: var(--gold);">IT'S YOUR SPECIAL DAY! HAPPY BIRTHDAY NOVI! ♡</h2>
                <p style="font-size: 1rem; line-height: 1.8; color: var(--lavender); margin-bottom: 15px;">
                    Selamat ulang tahun ya, Novi Aulia Pangestu. 🎂 Hari ini bumi berputar sedikit lebih meriah karena ada kamu di dalamnya. 
                    Terima kasih sudah bertahan sejauh ini, terima kasih sudah jadi Novi yang kuat, yang selalu bisa bikin orang di sekitarnya senyum. 
                    Sehat terus, bahagia terus, dan jangan lupa makan siang yang teratur ya! 🥺💖
                </p>
                <p style="font-size: 0.95rem; font-style: italic; color: var(--pink); margin-bottom: 30px;">
                    Eh tapi jangan nangis dulu ya... 🫣 Nanti mascara luntur, terus bingung kan? Wkwk. 
                    Pokoknya hari ini kamu ratu, kamu putri, kamu segalanya. Tapi besok balik lagi jadi manusia biasa yang harus bayar kos sendiri ya! 🤣 
                    Bercanda Novi... sekali lagi, Happy Birthday! Semoga panjang umur, murah rezeki. Aamiin. 💖
                </p>
            </div>
        </section>

        <!-- SECTION RANDOM WISHES (Muncul pas Hari H) -->
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

        <section class="photo-section">
            <h3 class="section-title">Moments of Novi 📸</h3>
            <div class="slider-container">
                <div class="slider-wrapper" id="sliderWrapper">
                    <img src="https://n.uguu.se/FaQfBXTj.jpeg" alt="Novi Photo 1" class="slide-img active" loading="lazy">
                    <img src="https://d.uguu.se/uETptHzF.jpeg" alt="Novi Photo 2" class="slide-img" loading="lazy">
                </div>
                <div class="slider-dots">
                    <span class="dot active" onclick="goToSlide(0)"></span>
                    <span class="dot" onclick="goToSlide(1)"></span>
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
        <source src="https://h.uguu.se/aEDONSMj.mp3" type="audio/mpeg">
    </audio>
    
    <!-- FLOATING CORNER BEAR -->
    <div class="corner-bear">
        <img src="assets/teddy-bear.svg" alt="Bear">
        <span class="heart-float">💖</span>
    </div>

    <script src="script.js"></script>
</body>
</html>
EOF

echo -e "${CYAN}[2/4] Update CSS (Ikon Floating & Wishes)...${NC}"

# Tambahin CSS Baru
cat >> "$WEB_ROOT/style.css" << 'CSSEOF'

/* ==============================
   FLOATING EMOJI EFFECT
   ============================== */
#floating-emojis {
    position: fixed;
    top: 0; left: 0; width: 100%; height: 100%;
    pointer-events: none;
    z-index: 1;
    overflow: hidden;
}
.floating-icon {
    position: absolute;
    bottom: -50px;
    font-size: 1.5rem;
    animation: floatUp linear forwards;
    opacity: 0;
}
@keyframes floatUp {
    0% { transform: translateY(0) rotate(0deg); opacity: 0; }
    10% { opacity: 0.8; }
    90% { opacity: 0.8; }
    100% { transform: translateY(-110vh) rotate(360deg); opacity: 0; }
}

/* ==============================
   CORNER BEAR (POJOK KANAN BAWAH)
   ============================== */
.corner-bear {
    position: fixed;
    bottom: 20px;
    right: 20px;
    width: 80px;
    height: 80px;
    z-index: 100;
    animation: bobbing 3s ease-in-out infinite;
    cursor: pointer;
    filter: drop-shadow(0 5px 15px rgba(255, 105, 180, 0.5));
}
.corner-bear img {
    width: 100%;
    height: 100%;
}
.heart-float {
    position: absolute;
    top: -10px;
    right: -5px;
    font-size: 1.2rem;
    animation: heartBeat 1s infinite alternate;
}
@keyframes bobbing {
    0%, 100% { transform: translateY(0) rotate(-5deg); }
    50% { transform: translateY(-10px) rotate(5deg); }
}
@keyframes heartBeat {
    from { transform: scale(1); }
    to { transform: scale(1.3); }
}

/* ==============================
   WISHES SECTION (UCAPAN RANDOM)
   ============================== */
.wishes-section {
    text-align: center;
    margin-top: 20px;
}
.wishes-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 15px;
    padding: 10px;
}
.wish-card {
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid var(--purple);
    border-radius: 15px;
    padding: 20px;
    text-align: left;
    backdrop-filter: blur(5px);
    transition: transform 0.3s;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}
.wish-card:hover {
    transform: translateY(-5px);
    border-color: var(--hot-pink);
}
.wish-card p {
    font-style: italic;
    font-size: 0.9rem;
    color: var(--lavender);
    margin-bottom: 10px;
    line-height: 1.5;
}
.wish-card span {
    display: block;
    text-align: right;
    font-weight: 600;
    color: var(--gold);
    font-size: 0.85rem;
}
CSSEOF

echo -e "${CYAN}[3/4] Update JS (Animasi & Trigger Hari H)...${NC}"

# Tambahin logika JS Baru
cat >> "$WEB_ROOT/script.js" << 'JSEOF'

// ==========================================
// LOGIKA FLOATING EMOJI (ICON LUCU)
// ==========================================
const emojiList = ['🧸', '💖', '🌸', '✨', '🎈', '🎀', '💕'];
const floatingContainer = document.getElementById('floating-emojis');

function createFloatingEmoji() {
    if (!floatingContainer) return;
    const emoji = document.createElement('div');
    emoji.className = 'floating-icon';
    emoji.innerText = emojiList[Math.floor(Math.random() * emojiList.length)];
    
    // Random posisi X, durasi, dan ukuran
    emoji.style.left = Math.random() * 100 + 'vw';
    const duration = Math.random() * 5 + 5; // 5-10 detik
    emoji.style.animationDuration = duration + 's';
    emoji.style.fontSize = (Math.random() * 1 + 1) + 'rem'; // 1-2rem
    
    floatingContainer.appendChild(emoji);
    
    // Hapus elemen setelah animasi selesai biar gak berat
    setTimeout(() => {
        emoji.remove();
    }, duration * 1000);
}

// Bikin emoji tiap 800ms
setInterval(createFloatingEmoji, 800);

// ==========================================
// UPDATE LOGIKA HARI H (Tampilkan Wishes)
// ==========================================
// Kita timpa logika interval yang lama dari script sebelumnya
// Cari elemen specialMsg & wishesSection
const specialMsgEl = document.getElementById('special-message');
const wishesSectionEl = document.getElementById('wishes-section');

// Pasang interval baru untuk cek setiap detik
setInterval(() => {
    const targetDate = new Date('2026-11-14T00:00:00').getTime();
    const now = new Date().getTime();
    const distance = targetDate - now;

    if (distance < 0) {
        // Kalau udah Hari H
        if (specialMsgEl.classList.contains('hidden')) {
            specialMsgEl.classList.remove('hidden');
            if (wishesSectionEl) wishesSectionEl.classList.remove('hidden');
        }
    }
}, 1000);
JSEOF

echo -e "${CYAN}[4/4] Membuat ZIP & Kirim ke Telegram...${NC}"
cd "$WEB_ROOT"
zip -r "$ZIP_PATH" . > /dev/null 2>&1

CAPTION="🎂 *Happy Birthday Novi - UPDATE v3.0*%0A%0A✅ Fitur Baru:%0A🧸 Ikon Lucu Berjatuhan%0A🐻 Teddy Bear di Pojok%0A💌 Ucapan Random Pas Hari H%0A%0A📦 ZIP v3 terlampir."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
    -F "chat_id=${ADMIN_ID}" \
    -F "document=@${ZIP_PATH}" \
    -F "caption=${CAPTION}" \
    -F "parse_mode=Markdown" > /dev/null

clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ UPDATE v3.0 BERHASIL!                  ║${NC}"
echo -e "${GREEN}║  🧸 Ikon Lucu • Teddy Pojok • Ucapan       ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 URL Web:${NC} https://$DOMAIN"
echo -e "${CYAN}📦 File ZIP v3 dikirim ke Telegram!${NC}"
echo ""
echo -e "${GREEN}🚀 Buka webnya, liat ikon berjatuhan & teddy di pojok! 🎂💖${NC}"
