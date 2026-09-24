const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// 1. Hero replacement
const heroSlidesOld = `    <div class="hero-slides" id="heroSlides">
      <div class="hero-slide active"
        style="background-image:url('assets/images/Chateau-Jardin-Vista-aerea-do-lazer-1.jpg')"></div>
      <div class="hero-slide" style="background-image:url('assets/images/Harmonie-Fachada-1920x1200_c.jpg')"></div>
      <div class="hero-slide"
        style="background-image:url('assets/images/Harmonie-Piscina-coberta-de-25m-com-raia.png')"></div>
      <div class="hero-slide" style="background-image:url('assets/images/Harmonie-Lobby.png')"></div>
    </div>`;
const heroVideoNew = `    <div class="hero-video" style="position:absolute;top:0;left:0;width:100%;height:100%;overflow:hidden;z-index:0;">
      <video autoplay muted loop playsinline id="heroVideoBg" style="width:100%;height:100%;object-fit:cover;">
        <source src="assets/video/empreendimento.mp4" type="video/mp4">
      </video>
      <button id="unmuteBtn" onclick="toggleMute()" aria-label="Ativar Som" style="position:absolute;bottom:40px;right:40px;background:rgba(0,0,0,0.5);color:#fff;border:1px solid rgba(255,255,255,0.3);border-radius:50%;width:50px;height:50px;cursor:pointer;z-index:10;font-size:1.2rem;backdrop-filter:blur(4px); transition:all 0.3s ease;">&#128263;</button>
    </div>`;

html = html.replace(heroSlidesOld, heroVideoNew);

const heroDotsOld = `    <div class="hero-dots" id="heroDots">
      <button class="dot active" onclick="goToSlide(0)"></button>
      <button class="dot" onclick="goToSlide(1)"></button>
      <button class="dot" onclick="goToSlide(2)"></button>
      <button class="dot" onclick="goToSlide(3)"></button>
    </div>`;
html = html.replace(heroDotsOld, '');

// 2. Remove old section-video
const regexVideoSection = /<section class="section-video" id="video">[\s\S]*?<\/section>/;
html = html.replace(regexVideoSection, '');

// 3. Extract sections to reorder
function extractSection(id) {
    const regex = new RegExp('<section class="section ' + id + '" id="' + id + '">[\\\\s\\\\S]*?<\\/section>');
    const match = html.match(regex);
    if(match) {
        html = html.replace(match[0], '');
        return match[0];
    }
    return '';
}

const secSignature = extractSection('signature');
const secDiferenciais = extractSection('diferenciais');
const secGaleria = extractSection('galeria');
const secLazer = extractSection('lazer');
const secAmbientes = extractSection('ambientes');
const secPlantas = extractSection('plantas');
const secTour = extractSection('tour');
const secLocalizacao = extractSection('localizacao');
const secPontos = extractSection('pontos');
const secProximidade = extractSection('proximidade');

// 4. Find the anchor point to insert them back
const anchor = '  </section>\r\n  <section class="section outros" id="outros">';
const anchorAlt = '  </section>\n  <section class="section outros" id="outros">';

const newOrder = '  </section>\n' + 
    secSignature + '\n' + 
    secDiferenciais + '\n' + 
    secGaleria + '\n' + 
    secLazer + '\n' + 
    secAmbientes + '\n' + 
    secPlantas + '\n' + 
    secTour + '\n' + 
    secLocalizacao + '\n' + 
    secPontos + '\n' + 
    secProximidade + '\n' + 
    '  <section class="section outros" id="outros">';

if (html.includes(anchor)) {
    html = html.replace(anchor, newOrder);
} else if (html.includes(anchorAlt)) {
    html = html.replace(anchorAlt, newOrder);
} else {
    // fallback if anchor is missing
    console.log("Anchor not found! Appending before footer...");
    html = html.replace(/<footer class="site-footer">/, newOrder + '\n<footer class="site-footer">');
}

fs.writeFileSync('index.html', html);
console.log('Reordering complete!');
