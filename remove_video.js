const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// Find and completely remove the section-video
const startStr = '<section class="section-video" id="video">';
const startIdx = html.indexOf(startStr);

if (startIdx !== -1) {
    const endIdx = html.indexOf('</section>', startIdx) + 10;
    html = html.substring(0, startIdx) + html.substring(endIdx);
    fs.writeFileSync('index.html', html);
    console.log('Removed section-video.');
} else {
    console.log('section-video not found.');
}
