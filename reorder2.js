const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// 1. Hero replacement
// We can find <div class="hero-slides" id="heroSlides"> and remove up to </div>\n    <div class="hero-overlay"></div>
const heroStart = html.indexOf('<div class="hero-slides" id="heroSlides">');
const heroEnd = html.indexOf('<div class="hero-overlay"></div>');

if (heroStart !== -1 && heroEnd !== -1) {
    const heroVideoNew = `    <div class="hero-video" style="position:absolute;top:0;left:0;width:100%;height:100%;overflow:hidden;z-index:0;">
      <video autoplay muted loop playsinline id="heroVideoBg" style="width:100%;height:100%;object-fit:cover;">
        <source src="assets/video/empreendimento.mp4" type="video/mp4">
      </video>
      <button id="unmuteBtn" onclick="toggleMute()" aria-label="Ativar Som" style="position:absolute;bottom:40px;right:40px;background:rgba(0,0,0,0.5);color:#fff;border:1px solid rgba(255,255,255,0.3);border-radius:50%;width:50px;height:50px;cursor:pointer;z-index:10;font-size:1.2rem;backdrop-filter:blur(4px); transition:all 0.3s ease;">&#128263;</button>
    </div>\n    `;
    
    html = html.substring(0, heroStart) + heroVideoNew + html.substring(heroEnd);
}

const dotsStart = html.indexOf('<div class="hero-dots" id="heroDots">');
if (dotsStart !== -1) {
    const dotsEnd = html.indexOf('</div>', dotsStart) + 6;
    html = html.substring(0, dotsStart) + html.substring(dotsEnd);
}

// 2. Extract sections
function extract(id) {
    const startStr = `<section class="section ${id}" id="${id}">`;
    const startIdx = html.indexOf(startStr);
    if (startIdx === -1) return '';
    
    // Find the NEXT <section to know where this one ends
    const nextSectionIdx = html.indexOf('<section class="section', startIdx + 1);
    const footerIdx = html.indexOf('<footer', startIdx);
    
    let endIdx;
    if (nextSectionIdx !== -1 && (nextSectionIdx < footerIdx || footerIdx === -1)) {
        endIdx = nextSectionIdx;
    } else {
        endIdx = footerIdx;
    }
    
    const content = html.substring(startIdx, endIdx);
    html = html.substring(0, startIdx) + html.substring(endIdx);
    return content;
}

// Ensure video section is fully gone
const secVideo = extract('video'); 
const secVideo2 = extract('section-video'); // just in case
// Extract others
const secSignature = extract('signature');
const secDiferenciais = extract('diferenciais');
const secGaleria = extract('galeria');
const secLazer = extract('lazer');
const secAmbientes = extract('ambientes');
const secPlantas = extract('plantas');
const secTour = extract('tour');
const secLocalizacao = extract('localizacao');
const secPontos = extract('pontos');
const secProximidade = extract('proximidade');
const secSobre = extract('sobre');

// Now find <section class="section outros"
const outrosStart = html.indexOf('<section class="section outros" id="outros">');

const newContent = 
    secSobre + 
    secSignature + 
    secDiferenciais + 
    secGaleria + 
    secLazer + 
    secAmbientes + 
    secPlantas + 
    secTour + 
    secLocalizacao + 
    secPontos + 
    secProximidade;

if (outrosStart !== -1) {
    html = html.substring(0, outrosStart) + newContent + html.substring(outrosStart);
} else {
    const footerStart = html.indexOf('<footer');
    html = html.substring(0, footerStart) + newContent + html.substring(footerStart);
}

fs.writeFileSync('index.html', html);
console.log('Reordering DONE');
