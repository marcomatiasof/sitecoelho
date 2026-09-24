const fs = require('fs');

// 1. Remove headline from index.html
let html = fs.readFileSync('index.html', 'utf-8');

const heroTopStart = html.indexOf('<div class="hero-top" style="width: 100%;">');
if (heroTopStart !== -1) {
    const heroTopEnd = html.indexOf('</div>', heroTopStart) + 6;
    html = html.substring(0, heroTopStart) + html.substring(heroTopEnd);
}

fs.writeFileSync('index.html', html);

// 2. Fix CSS in style.css to guarantee buttons are at the bottom
let css = fs.readFileSync('style.css', 'utf-8');

// The .custom-hero-layout currently has flexbox. Let's make it simple.
const oldLayout = `.custom-hero-layout {
    position: absolute;
    z-index: 10;
    top: 0; left: 0;
    width: 100%; min-height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    box-sizing: border-box;
    /* Reset old styles */
    transform: none !important;
    max-width: none !important;
}`;

const newLayout = `.custom-hero-layout {
    position: absolute;
    z-index: 10;
    top: 0; left: 0;
    width: 100%; height: 100vh;
    /* Reset old styles */
    transform: none !important;
    max-width: none !important;
    pointer-events: none; /* Let clicks pass through if needed, except buttons */
}`;

const oldBottom = `.custom-hero-bottom {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1.5rem;
}`;

const newBottom = `.custom-hero-bottom {
    position: absolute;
    bottom: 60px;
    left: 50%;
    transform: translateX(-50%);
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1.5rem;
    pointer-events: auto; /* Re-enable clicks for buttons */
}`;

const oldMobile = `@media (max-width: 768px) {
    .custom-hero-layout {
        padding: 90px 15px 30px 15px; /* Less top padding so title goes up, less bottom padding so buttons fit */
    }`;

const newMobile = `@media (max-width: 768px) {
    .custom-hero-bottom {
        bottom: 30px;
        gap: 0.8rem;
    }
    .custom-hero-layout {
        padding: 0;
    }`;

css = css.replace(oldLayout, newLayout);
css = css.replace(oldBottom, newBottom);
css = css.replace(oldMobile, newMobile);

fs.writeFileSync('style.css', css);

console.log('Headline removed and buttons fixed to bottom.');
