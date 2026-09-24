const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// 1. Remove the "Ligar" button
const btnCallStart = html.indexOf('<button class="float-btn call"');
if (btnCallStart !== -1) {
    const btnCallEnd = html.indexOf('</button>', btnCallStart) + 9;
    html = html.substring(0, btnCallStart) + html.substring(btnCallEnd);
}

// 2. Make the Hero headline responsive for mobile
// Current: style="color: #fff; font-size: 1.5rem; font-weight: 500; margin-bottom: 10px; max-width: 800px; text-align: center; text-shadow: 1px 1px 4px rgba(0,0,0,0.8);"
const oldStyle = 'style="color: #fff; font-size: 1.5rem; font-weight: 500; margin-bottom: 10px; max-width: 800px; text-align: center; text-shadow: 1px 1px 4px rgba(0,0,0,0.8);"';
const newStyle = 'style="color: #fff; font-size: clamp(1.1rem, 4vw, 1.5rem); font-weight: 500; margin-bottom: 10px; max-width: 800px; text-align: center; text-shadow: 1px 1px 4px rgba(0,0,0,0.8); padding: 0 1rem; line-height: 1.4;"';
html = html.replace(oldStyle, newStyle);

// Let's also make sure the hero buttons wrap properly on mobile
// In index.html, hero-actions is likely flex. Let's add inline styles if needed or let CSS handle it.
// style.css handles `.hero-actions { display: flex; flex-wrap: wrap; justify-content: center; gap: 1rem; }` so it's fine.

fs.writeFileSync('index.html', html);
console.log('Mobile optimizations applied and Ligar button removed.');
