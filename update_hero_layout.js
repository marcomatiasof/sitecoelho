const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// The current hero-content block
const heroContentStart = html.indexOf('<div class="hero-content" style="z-index: 10;">');
const scrollHintStart = html.indexOf('<div class="hero-scroll-hint">');
if (heroContentStart !== -1 && scrollHintStart !== -1) {
    const newHeroContent = `
    <div class="hero-content" style="z-index: 10; top: 0; left: 0; transform: none; height: 100%; justify-content: space-between; padding: 100px 20px 60px 20px;">
      
      <div class="hero-top" style="width: 100%;">
        <h2 style="color: #fff; font-size: clamp(1.2rem, 3vw, 2.5rem); font-weight: 700; text-align: center; text-shadow: 2px 2px 8px rgba(0,0,0,0.9); letter-spacing: 2px; text-transform: uppercase; line-height: 1.3;">
          O VERDADEIRO LUXO É A EXCLUSIVIDADE.<br>DESCUBRA O NOVO MARCO DO CIDADE JARDIM.
        </h2>
      </div>

      <div class="hero-bottom" style="width: 100%; display: flex; flex-direction: column; align-items: center; gap: 1.5rem;">
        <div class="hero-actions" style="margin-bottom: 0;">
          <button class="btn-hero-primary" onclick="openModal('modal-visita')">AGENDAR VISITA EXCLUSIVA</button>
          <a href="#sobre" class="btn-hero-outline">CONHEÇA O PROJETO</a>
        </div>
        
        <button id="unmuteBtn" onclick="const v = document.getElementById('heroVideoBg'); v.muted = !v.muted; this.innerHTML = v.muted ? '&#128263; Ativar Som' : '&#128266; Desativar Som';" style="background:rgba(0,0,0,0.5);color:var(--gold);border:1px solid var(--gold);border-radius:20px;padding:8px 16px;cursor:pointer;font-size:0.9rem;backdrop-filter:blur(4px);transition:all 0.3s ease;">&#128263; Ativar Som</button>
      </div>

    </div>
    `;
    
    html = html.substring(0, heroContentStart) + newHeroContent + html.substring(scrollHintStart);
}

fs.writeFileSync('index.html', html);
console.log('Hero layout updated.');
