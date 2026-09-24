const fs = require('fs');

let html = fs.readFileSync('index.html', 'utf-8');

// 1. Fix the Hero Video (Remove overlay text, keep just the video, add controls, remove muted if requested but browsers block it, so let's add controls so user can interact)
// The user said: "quero somente o video direto voce duplicou quero o video com som ali"
// Current Hero:
/*
  <section class="hero" id="hero">
    <div class="hero-video" style="...">
      <video autoplay muted loop playsinline id="heroVideoBg" ...>
        <source src="assets/video/empreendimento.mp4" ...>
      </video>
      <button ...>
    </div>
    <div class="hero-overlay"></div>
    <div class="hero-content">
      ...
    </div>
    <div class="hero-scroll-hint">...</div>
  </section>
*/

// Let's replace the whole hero section with just a clean video block
const newHero = `  <section class="hero" id="hero" style="height: auto; min-height: unset; padding: 0; background: #000;">
    <div class="hero-video" style="width:100%; max-height: 80vh; display: flex; justify-content: center; background: #000;">
      <video autoplay controls playsinline style="width:100%; max-height: 80vh; object-fit: contain;">
        <source src="assets/video/empreendimento.mp4" type="video/mp4">
      </video>
    </div>
  </section>`;

const heroStart = html.indexOf('<section class="hero" id="hero">');
const heroEnd = html.indexOf('</section>', heroStart) + 10;
html = html.substring(0, heroStart) + newHero + html.substring(heroEnd);

// 2. Insert the title, features and persuasive headline below the video, before "sobre"
// Promptbook high-ticket copy:
// Headline: "Existe um padrão de vida que a maioria apenas sonha. Você está prestes a vivê-lo."
// Or "O verdadeiro luxo não é ter, é pertencer ao Novo Eixo Cidade Jardim."

const newPresentation = `
  <section class="section apresentacao" id="apresentacao" style="background: var(--bg-dark); padding-top: 4rem;">
    <div class="container" style="text-align: center;">
      <h2 style="color: var(--gold); font-family: var(--font-serif); font-size: 2rem; margin-bottom: 1rem; font-weight: 400; line-height: 1.3;">
        O mercado imobiliário paulistano está saturado de projetos que parecem iguais.<br>
        Mas existe uma exceção. E ela acaba de nascer.
      </h2>
      <span class="badge-lancamento" style="display:inline-block; margin-bottom: 1rem;">&#10006; Lan&#231;amento</span>
      
      <h1 class="hero-title" style="margin-bottom: 0.5rem; font-size: 4rem;">Ch&#226;teau <em>Jardin</em></h1>
      <p class="hero-address" style="margin-bottom: 3rem;">R. Min. Nelson Hungria, 400 &middot; Cidade Jardim, S&#227;o Paulo &#8211; SP</p>
      
      <div class="hero-features" style="justify-content: center; margin-bottom: 3rem;">
        <div class="hero-feat"><span class="feat-icon">&#127963;</span><span class="feat-text">Arquitetura<br><strong>by EDSA</strong></span></div>
        <div class="hero-sep"></div>
        <div class="hero-feat"><span class="feat-icon">&#128716;</span><span class="feat-text">De 3 a 4<br><strong>Su&#237;tes</strong></span></div>
        <div class="hero-sep"></div>
        <div class="hero-feat"><span class="feat-icon">&#127934;</span><span class="feat-text">Le Court<br><strong>Quadra de Saibro</strong></span></div>
      </div>
      
      <div class="hero-actions" style="justify-content: center;">
        <button class="btn-hero-primary" onclick="openModal('modal-visita')">Agendar Visita Exclusiva</button>
        <a href="#sobre" class="btn-hero-outline">Conhe&#231;a o Projeto</a>
      </div>
    </div>
  </section>
`;

html = html.replace('<section class="section sobre"', newPresentation + '\n  <section class="section sobre"');

// 3. Rewrite "sobre" (O Conceito) to be more persuasive
// Old Text: "A elegância atemporal do Novo Eixo Cidade Jardim... Sofisticação em cada detalhe. O Château Jardin nasce da convicção de que a grande arquitetura não escolhe apenas formas..."
// Let's change the headline and text.

const oldSobreStart = html.indexOf('<div class="sobre-text reveal">');
const oldSobreEnd = html.indexOf('</div>', html.indexOf('</button>', oldSobreStart)) + 6;

const newSobreText = `<div class="sobre-text reveal">
          <span class="section-label">O Problema & A Solução</span>
          <h2 class="section-title">Por que se contentar com o comum quando você pode ter exclusividade?</h2>
          <p>Se você já procurou imóveis de alto padrão em São Paulo, sabe a frustração: plantas mal resolvidas, localizações que prometem mas não entregam, e projetos sem personalidade.</p>
          <p>O <strong>Château Jardin</strong> foi desenhado exatamente para quem não aceita menos que a perfeição. Localizado no coração do Novo Eixo Cidade Jardim, ele une a grandiosidade da arquitetura clássica à tecnologia contemporânea.</p>
          <p>Com projeto paisagístico internacional by <strong>EDSA</strong> e tropicalização por <strong>Beneditto Abudd</strong>, entregamos não apenas um apartamento, mas o seu refúgio privativo. O mecanismo único de personalização permite que você tenha a casa dos seus sonhos, já na planta.</p>
          <div class="sobre-pills">
            <span class="pill">Alto padrão construtivo</span>
            <span class="pill">Projeto by EDSA</span>
            <span class="pill">Áreas comuns decoradas</span>
            <span class="pill">Gerador Full</span>
          </div>
          <button class="btn-secondary" onclick="openModal('modal-ficha')">Ver Ficha Técnica Completa</button>
        </div>`;

if (oldSobreStart !== -1) {
    html = html.substring(0, oldSobreStart) + newSobreText + html.substring(oldSobreEnd);
}

// Write the changes
fs.writeFileSync('index.html', html);
console.log('Copy updated and Hero Video fixed.');
