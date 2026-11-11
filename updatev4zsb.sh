#!/bin/bash
# ==========================================
# 🎂 HAPPY BIRTHDAY NOVI - v8.0 PAPER COUNTDOWN
# Paper Style • No Text Wrap • Keep All Features
# ==========================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

[[ $EUID -ne 0 ]] && { echo -e "${RED}❌ Harus root!${NC}"; exit 1; }

read -p "👉 Masukkan Domain Web (contoh: novi.rendzzclouds.my.id): " DOMAIN
[[ -z "$DOMAIN" ]] && { echo -e "${RED}❌ Domain tidak boleh kosong!${NC}"; exit 1; }

WEB_ROOT="/var/www/$DOMAIN"
ZIP_NAME="Happy_Birthday_Novi_v8.zip"
ZIP_PATH="/root/$ZIP_NAME"

BOT_TOKEN="9288512136:AAGiCkQx-vPskCQO3EeEiDYIWXv6Ga4iyOw"
ADMIN_ID="8820969131"

if [ ! -d "$WEB_ROOT" ]; then
    echo -e "${RED}❌ Folder web tidak ditemukan! Pastikan domain benar.${NC}"; exit 1
fi

echo -e "${CYAN}[1/3] Update CSS (Paper Countdown Style)...${NC}"

# Hapus CSS countdown lama (kalau ada) biar ga bentrok
sed -i '/\.countdown-container {/,/\.countdown-label {/d' "$WEB_ROOT/style.css"
sed -i '/\.countdown-box {/,/\.countdown-number {/d' "$WEB_ROOT/style.css"

# Tambahin CSS Paper Countdown yang baru
cat >> "$WEB_ROOT/style.css" << 'CSSEOF'

/* ==============================
   PAPER STYLE COUNTDOWN (ANTI CEDUT)
   ============================== */
.countdown-section {
    text-align: center;
    background: var(--glass);
    padding: 30px 15px;
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    position: relative;
    /* Efek kertas sobek di atas */
    clip-path: polygon(
        0% 5%, 5% 0%, 10% 5%, 15% 0%, 20% 5%, 25% 0%, 30% 5%, 35% 0%, 
        40% 5%, 45% 0%, 50% 5%, 55% 0%, 60% 5%, 65% 0%, 70% 5%, 75% 0%, 
        80% 5%, 85% 0%, 90% 5%, 95% 0%, 100% 5%, 100% 100%, 0% 100%
    );
}

.countdown-container {
    display: flex;
    justify-content: center;
    gap: 8px;
    flex-wrap: nowrap; /* Biar ga turun baris */
    margin-top: 15px;
}

.countdown-box {
    background: linear-gradient(145deg, #fdfbfb 0%, #ebedee 100%);
    color: #333;
    border-radius: 8px;
    padding: 12px 5px;
    flex: 1;
    max-width: 75px; /* Biar muat 4 kotak di HP */
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 0 4px 6px rgba(0,0,0,0.3), inset 0 0 10px rgba(255,255,255,0.8);
    position: relative;
    border: 1px solid #ddd;
}

/* Efek selotip kertas */
.countdown-box::before {
    content: '';
    position: absolute;
    top: -5px;
    width: 30px;
    height: 10px;
    background: rgba(255, 182, 193, 0.7); /* Selotip pink transparan */
    transform: rotate(-3deg);
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.countdown-number {
    font-size: 1.5rem;
    font-weight: 800;
    font-family: 'Playfair Display', serif;
    color: #c71585; /* Warna hot pink gelap */
    line-height: 1;
    white-space: nowrap; /* KUNCI: Biar angka ga cedut */
}

.countdown-label {
    font-size: 0.65rem;
    color: #666;
    text-transform: uppercase;
    font-weight: 600;
    margin-top: 5px;
    white-space: nowrap; /* KUNCI: Biar tulisan ga cedut */
}

/* Responsive buat layar super kecil */
@media (max-width: 360px) {
    .countdown-box { padding: 10px 2px; }
    .countdown-number { font-size: 1.2rem; }
    .countdown-label { font-size: 0.55rem; }
}
CSSEOF

echo -e "${CYAN}[2/3] Cek Kelengkapan HTML (Pastikan Foto & Musik Aman)...${NC}"
# Kita cuma mastiin strukturnya bener, ga ngerombak HTML
if ! grep -q "photoStack" "$WEB_ROOT/index.html"; then
    echo -e "${RED}❌ Error: HTML lama tidak ditemukan.${NC}"
    exit 1
fi
echo -e "${GREEN}  ✅ HTML aman (Foto & Musik tetap ada).${NC}"

echo -e "${CYAN}[3/3] Membuat ZIP & Kirim ke Telegram...${NC}"
cd "$WEB_ROOT"
zip -r "$ZIP_PATH" . > /dev/null 2>&1

CAPTION="🎂 *Happy Birthday Novi - v8.0 PAPER STYLE*%0A%0A✅ Countdown model Kertas (Anti Cedut)%0A✅ Foto & Musik Tetap Aman%0A✅ Teks Luluh & /coba Tetap Ada%0A%0A📦 ZIP terlampir."

curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendDocument" \
    -F "chat_id=${ADMIN_ID}" \
    -F "document=@${ZIP_PATH}" \
    -F "caption=${CAPTION}" \
    -F "parse_mode=Markdown" > /dev/null

clear
echo -e "${GREEN}╔════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ UPDATE v8.0 BERHASIL!                  ║${NC}"
echo -e "${GREEN}║  📜 Paper Countdown • Anti Cedut           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}🔗 Web Utama:${NC} https://$DOMAIN"
echo -e "${CYAN}📦 File ZIP v8 dikirim ke Telegram!${NC}"
echo ""
echo -e "${GREEN}🚀 Buka webnya, countdown-nya sekarang model kertas cantik! 🎂💖${NC}"
