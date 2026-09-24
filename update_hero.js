const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// The current hero looks like:
/*
  <section class="hero" id="hero" style="height: auto; min-height: unset; padding: 0; background: #000;">
    <div class="hero-video" style="width:100%; max-height: 80vh; display: flex; justify-content: center; background: #000;">
      <video autoplay controls playsinline style="width:100%; max-height: 80vh; object-fit: contain;">
        <source src="assets/video/empreendimento.mp4" type="video/mp4">
      </video>
    </div>
  </section>
*/

// Let's replace it with the overlay style they liked, but only keeping the buttons (and maybe the Lançamento badge with a headline above it if they wanted that).
// "o jeito que estava antes estava melhor so tirar aquelas letra la e pode deixar o que te mandei no prin pf" (the print just shows the buttons).
// Let's put the headline + Lançamento + Buttons. 
// "quero um head line acima de lançamento que prenda atença de fato" -> Let's add a strong headline there.

const newHero = `  <section class="hero" id="hero">
    <div class="hero-video" style="position:absolute;top:0;left:0;width:100%;height:100%;overflow:hidden;z-index:0;">
      <video autoplay muted loop playsinline id="heroVideoBg" style="width:100%;height:100%;object-fit:cover;">
        <source src="assets/video/empreendimento.mp4" type="video/mp4">
      </video>
    </div>
    <div class="hero-overlay"></div>
    <div class="hero-content" style="z-index: 10;">
      <h2 style="color: #fff; font-size: 1.5rem; font-weight: 500; margin-bottom: 10px; max-width: 800px; text-align: center; text-shadow: 1px 1px 4px rgba(0,0,0,0.8);">
        O mercado imobiliário paulistano está saturado de projetos que parecem iguais.<br>Mas existe uma exceção. E ela acaba de nascer.
      </h2>
      <span class="badge-lancamento" style="margin-bottom: 2rem;">&#10006; Lan&#231;amento</span>
      
      <!-- Only buttons as requested in the print -->
      <div class="hero-actions">
        <button class="btn-hero-primary" onclick="openModal('modal-visita')">Agendar Visita Exclusiva</button>
        <a href="#sobre" class="btn-hero-outline">Conhe&#231;a o Projeto</a>
      </div>
      
      <!-- Custom Mute/Unmute button for the background video -->
      <button id="unmuteBtn" onclick="const v = document.getElementById('heroVideoBg'); v.muted = !v.muted; this.innerHTML = v.muted ? '&#128263; Ativar Som' : '&#128266; Desativar Som';" style="margin-top: 30px; background:rgba(0,0,0,0.5);color:var(--gold);border:1px solid var(--gold);border-radius:20px;padding:8px 16px;cursor:pointer;font-size:0.9rem;backdrop-filter:blur(4px);transition:all 0.3s ease;">&#128263; Ativar Som</button>
    </div>
    <div class="hero-scroll-hint"><span>Role para descobrir</span>
      <div class="scroll-arrow"></div>
    </div>
  </section>`;

const heroStart = html.indexOf('<section class="hero" id="hero"');
const heroEnd = html.indexOf('</section>', heroStart) + 10;
html = html.substring(0, heroStart) + newHero + html.substring(heroEnd);

// Also remove the "apresentacao" section we added below because they want the headline in the video
const aprStart = html.indexOf('<section class="section apresentacao" id="apresentacao"');
const aprEnd = html.indexOf('</section>', aprStart) + 10;
if (aprStart !== -1) {
    html = html.substring(0, aprStart) + html.substring(aprEnd);
}

fs.writeFileSync('index.html', html);
console.log('Hero updated back to overlay style.');
