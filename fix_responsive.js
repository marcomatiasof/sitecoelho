const fs = require('fs');

// 1. Clean index.html inline styles
let html = fs.readFileSync('index.html', 'utf-8');

// The current hero-content div
const oldHeroContent = '<div class="hero-content" style="position: absolute; z-index: 10; top: 0; left: 0; transform: none; width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: space-between; align-items: center; padding: 120px 20px 50px 20px; box-sizing: border-box;">';
const newHeroContent = '<div class="hero-content custom-hero-layout">';
html = html.replace(oldHeroContent, newHeroContent);

// The headline inline style
const oldHeadline = '<h2 style="color: #fff; font-size: clamp(1.2rem, 3vw, 2.5rem); font-weight: 700; text-align: center; text-shadow: 2px 2px 8px rgba(0,0,0,0.9); letter-spacing: 2px; text-transform: uppercase; line-height: 1.3;">';
const newHeadline = '<h2 class="hero-custom-title">';
html = html.replace(oldHeadline, newHeadline);

// The hero-bottom inline style
const oldHeroBottom = '<div class="hero-bottom" style="width: 100%; display: flex; flex-direction: column; align-items: center; gap: 1.5rem;">';
const newHeroBottom = '<div class="hero-bottom custom-hero-bottom">';
html = html.replace(oldHeroBottom, newHeroBottom);

// The unmuteBtn inline style
const oldBtn = 'style="background:rgba(0,0,0,0.5);color:var(--gold);border:1px solid var(--gold);border-radius:20px;padding:8px 16px;cursor:pointer;font-size:0.9rem;backdrop-filter:blur(4px);transition:all 0.3s ease;"';
const newBtn = 'class="btn-unmute-custom"';
html = html.replace(oldBtn, newBtn);

fs.writeFileSync('index.html', html);

// 2. Append CSS to style.css
let css = fs.readFileSync('style.css', 'utf-8');

const newCSS = `
/* --- HERO CUSTOM LAYOUT --- */
.custom-hero-layout {
    position: absolute;
    z-index: 10;
    top: 0; left: 0;
    width: 100%; height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    /* Reset old styles */
    transform: none !important;
    max-width: none !important;
}

/* Desktop Defaults */
.custom-hero-layout {
    padding: 160px 40px 60px 40px;
}
.hero-custom-title {
    color: #fff;
    font-size: 2.8rem;
    font-weight: 700;
    text-align: center;
    text-shadow: 2px 2px 8px rgba(0,0,0,0.9);
    letter-spacing: 2px;
    text-transform: uppercase;
    line-height: 1.2;
    max-width: 1000px;
    margin: 0 auto;
}
.custom-hero-bottom {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1.5rem;
}
.btn-unmute-custom {
    background: rgba(0,0,0,0.5);
    color: var(--gold);
    border: 1px solid var(--gold);
    border-radius: 20px;
    padding: 8px 16px;
    cursor: pointer;
    font-size: 0.9rem;
    backdrop-filter: blur(4px);
    transition: all 0.3s ease;
}

/* Mobile Adjustments */
@media (max-width: 768px) {
    .custom-hero-layout {
        padding: 90px 15px 30px 15px; /* Less top padding so title goes up, less bottom padding so buttons fit */
    }
    .hero-custom-title {
        font-size: 1.3rem; /* Smaller to fit perfectly */
        letter-spacing: 1px;
    }
    .custom-hero-bottom {
        gap: 0.8rem; /* Tighter gap between buttons */
    }
    .hero-actions .btn-hero-primary, 
    .hero-actions .btn-hero-outline {
        padding: 10px 20px; /* Smaller buttons */
        font-size: 0.85rem;
        width: 100%;
    }
    .hero-actions {
        display: flex;
        flex-direction: column;
        width: 100%;
        gap: 8px;
    }
    .btn-unmute-custom {
        padding: 6px 12px;
        font-size: 0.8rem;
    }
}
`;

if (!css.includes('/* --- HERO CUSTOM LAYOUT --- */')) {
    fs.writeFileSync('style.css', css + '\\n' + newCSS);
}

console.log('CSS and HTML updated.');
