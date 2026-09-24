const fs = require('fs');
const path = require('path');

const files = [
  'ampere-brooklin.html',
  'ledge-brooklin.html',
  'legacy-guedala.html',
  'only-cidade-jardim.html',
  'splend-moema.html',
  'the-selection-moema.html',
  'the-view-ibirapuera.html'
];

files.forEach(file => {
  const filePath = path.join(__dirname, file);
  let content = fs.readFileSync(filePath, 'utf8');

  // Match the entire <section class="section plantas" id="plantas"> ... </section>
  const regex = /(<section class="section plantas" id="plantas">)[\s\S]*?(<\/section>)/;
  
  // Extract the project name from the title to customize the WhatsApp message if possible,
  // or just use a generic one. Let's find the project name from <title>
  const titleMatch = content.match(/<title>(.*?) \|/);
  const projectName = titleMatch ? titleMatch[1].trim() : 'o projeto';
  const wppText = encodeURIComponent(`Olá! Gostaria de receber o Caderno de Plantas completo em PDF do ${projectName}.`);

  const replacement = `$1
    <div class="container">
      <span class="section-label center reveal">Projetos Arquitet&#244;nicos &amp; Tipologias</span>
      <h2 class="section-title center reveal">Caderno T&#233;cnico de Plantas</h2>
      <p class="section-sub center reveal" style="max-width: 720px; margin: 0 auto 40px;">Plantas humanizadas com cotas e caderno de personaliza&#231;&#227;o dispon&#237;veis sob consulta exclusiva com nossa assessoria especializada.</p>
      
      <div class="plantas-vip-concierge reveal">
        <div class="pvc-left">
          <div class="pvc-badge">&#128216; Caderno T&#233;cnico em PDF de Alta Defini&#231;&#227;o</div>
          <h3>Deseja analisar a distribui&#231;&#227;o dos c&#244;modos ou op&#231;&#245;es de layout?</h3>
          <p>Nossos consultores Quero Im&#243;veis J&#225; fornecem atendimento personalizado, enviando o book completo com plantas cotadas, medidas e acabamentos diretamente no seu WhatsApp.</p>
        </div>
        <div class="pvc-right">
          <a href="https://wa.me/5511950332503?text=${wppText}" target="_blank" rel="noopener" class="btn-primary wpp-highlight">
            &#128172; Receber Caderno no WhatsApp
          </a>
          <button type="button" class="btn-outline-gold" onclick="openModal('modal-visita')">Agendar Apresenta&#231;&#227;o Particular</button>
        </div>
      </div>
    </div>
  $2`;

  content = content.replace(regex, replacement);
  fs.writeFileSync(filePath, content, 'utf8');
  console.log(`Updated ${file}`);
});
