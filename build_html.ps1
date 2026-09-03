$out = [System.IO.StreamWriter]::new("$PSScriptRoot\index.html", $false, [System.Text.Encoding]::UTF8)
function W($s){ $out.WriteLine($s) }

W '<!DOCTYPE html>'
W '<html lang="pt-BR">'
W '<head>'
W '  <meta charset="UTF-8">'
W '  <meta name="viewport" content="width=device-width, initial-scale=1.0">'
W '  <title>Chateau Jardin - Lancamento | Cidade Jardim, Sao Paulo</title>'
W '  <meta name="description" content="Chateau Jardin e o mais sofisticado lancamento residencial do Novo Eixo Cidade Jardim. Arquitetura classica-atemporal, projeto internacional EDSA, apartamentos de 185m2 a 355m2.">'
W '  <meta property="og:title" content="Chateau Jardin - Sofisticacao em Cada Detalhe">'
W '  <meta property="og:description" content="Lancamento exclusivo no Novo Eixo Cidade Jardim, Sao Paulo. Arquitetura classica contemporanea, projeto by EDSA, lazer resort e personalizacao Signature.">'
W '  <meta property="og:image" content="assets/images/Chateau-Jardin-Vista-aerea-do-lazer-1.jpg">'
W '  <meta property="og:type" content="website">'
W '  <link rel="preconnect" href="https://fonts.googleapis.com">'
W '  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
W '  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;1,300;1,400;1,600&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">'
W '  <link rel="stylesheet" href="style.css">'
W '</head>'
W '<body>'

# HEADER
W '<header class="site-header" id="site-header">'
W '  <div class="header-inner">'
W '    <div class="header-logo">'
W '      <span class="logo-text">CH&#194;TEAU <em>JARDIN</em></span>'
W '      <span class="logo-sub">Por Quero Im&#243;veis J&#225; &#8211; CRECI 037234-J</span>'
W '    </div>'
W '    <nav class="header-nav">'
W '      <a href="#sobre">Conceito</a>'
W '      <a href="#lazer">Lazer</a>'
W '      <a href="#plantas">Plantas</a>'
W '      <a href="#localizacao">Localiza&#231;&#227;o</a>'
W '      <a href="#contato">Contato</a>'
W '    </nav>'
W '    <div class="header-cta">'
W '      <a href="https://wa.me/5511969155717" target="_blank" rel="noopener" class="btn-phone">&#128172; (11) 96915-5717</a>'
W '      <button class="btn-primary" onclick="openModal(''modal-visita'')">Agendar Visita</button>'
W '    </div>'
W '    <button class="hamburger" id="hamburger" onclick="toggleMenu()"><span></span><span></span><span></span></button>'
W '  </div>'
W '  <div class="mobile-menu" id="mobile-menu">'
W '    <a href="#sobre" onclick="toggleMenu()">Conceito</a>'
W '    <a href="#lazer" onclick="toggleMenu()">Lazer</a>'
W '    <a href="#plantas" onclick="toggleMenu()">Plantas</a>'
W '    <a href="#localizacao" onclick="toggleMenu()">Localiza&#231;&#227;o</a>'
W '    <a href="#contato" onclick="toggleMenu()">Contato</a>'
W '    <button class="btn-primary" onclick="openModal(''modal-visita'');toggleMenu()">Agendar Visita</button>'
W '  </div>'
W '</header>'

# HERO
W '<section class="hero" id="hero">'
W '  <div class="hero-slides" id="heroSlides">'
W '    <div class="hero-slide active" style="background-image:url(''assets/images/Chateau-Jardin-Vista-aerea-do-lazer-1.jpg'')"></div>'
W '    <div class="hero-slide" style="background-image:url(''assets/images/Harmonie-Fachada-1920x1200_c.jpg'')"></div>'
W '    <div class="hero-slide" style="background-image:url(''assets/images/Harmonie-Piscina-coberta-de-25m-com-raia.png'')"></div>'
W '    <div class="hero-slide" style="background-image:url(''assets/images/Harmonie-Lobby.png'')"></div>'
W '  </div>'
W '  <div class="hero-overlay"></div>'
W '  <div class="hero-content">'
W '    <span class="badge-lancamento">&#10006; Lan&#231;amento</span>'
W '    <h1 class="hero-title">Ch&#226;teau <em>Jardin</em></h1>'
W '    <p class="hero-address">R. Min. Nelson Hungria, 400 &middot; Cidade Jardim, S&#227;o Paulo &#8211; SP</p>'
W '    <div class="hero-features">'
W '      <div class="hero-feat"><span class="feat-icon">&#127963;</span><span class="feat-text">Arquitetura<br><strong>by EDSA</strong></span></div>'
W '      <div class="hero-sep"></div>'
W '      <div class="hero-feat"><span class="feat-icon">&#128716;</span><span class="feat-text">De 3 a 4<br><strong>Su&#237;tes</strong></span></div>'
W '      <div class="hero-sep"></div>'
W '      <div class="hero-feat"><span class="feat-icon">&#127934;</span><span class="feat-text">Le Court<br><strong>Quadra de Saibro</strong></span></div>'
W '    </div>'
W '    <div class="hero-actions">'
W '      <button class="btn-hero-primary" onclick="openModal(''modal-visita'')">Agendar Visita Exclusiva</button>'
W '      <a href="#sobre" class="btn-hero-outline">Conhe&#231;a o Projeto</a>'
W '    </div>'
W '  </div>'
W '  <div class="hero-dots" id="heroDots">'
W '    <button class="dot active" onclick="goToSlide(0)"></button>'
W '    <button class="dot" onclick="goToSlide(1)"></button>'
W '    <button class="dot" onclick="goToSlide(2)"></button>'
W '    <button class="dot" onclick="goToSlide(3)"></button>'
W '  </div>'
W '  <div class="hero-scroll-hint"><span>Role para descobrir</span><div class="scroll-arrow"></div></div>'
W '</section>'

# SOBRE
W '<section class="section sobre" id="sobre">'
W '  <div class="container">'
W '    <div class="sobre-grid">'
W '      <div class="sobre-text reveal">'
W '        <span class="section-label">O Conceito</span>'
W '        <h2 class="section-title">A elegan&#231;a atemporal<br>do Novo Eixo Cidade Jardim</h2>'
W '        <p>Sofistica&#231;&#227;o em cada detalhe. O Ch&#226;teau Jardin nasce da convic&#231;&#227;o de que a grande arquitetura n&#227;o escolhe apenas formas &#8212; ela escolhe o tempo em que quer existir. Com inspira&#231;&#227;o cl&#225;ssica e leveza contempor&#226;nea, o projeto cria um novo marco residencial no cora&#231;&#227;o do Novo Eixo Cidade Jardim.</p>'
W '        <p>Propor&#231;&#227;o, verde e luz como cen&#225;rios cotidianos. O projeto internacional de paisagismo, assinado pelo renomado escrit&#243;rio <strong>EDSA</strong> e tropicalizado por <strong>Beneditto Abudd</strong>, traz a natureza como protagonista do seu dia a dia.</p>'
W '        <p>Para aqueles que buscam n&#227;o apenas um apartamento, mas um estilo de vida &#8212; onde cada ambiente reflete uma curadoria precisa de conforto, privacidade e beleza arquitet&#244;nica.</p>'
W '        <div class="sobre-pills">'
W '          <span class="pill">Alto padr&#227;o construtivo</span>'
W '          <span class="pill">Projeto by EDSA</span>'
W '          <span class="pill">&#193;reas comuns decoradas</span>'
W '          <span class="pill">Gerador Full</span>'
W '        </div>'
W '        <button class="btn-secondary" onclick="openModal(''modal-ficha'')">Ver Ficha T&#233;cnica Completa</button>'
W '      </div>'
W '      <div class="sobre-images reveal">'
W '        <div class="img-stack">'
W '          <img src="assets/images/Harmonie-Portico-Alto-padrao-construtivo-com-design-e-arquitetura-classica-com-projeto-assinado-por-Dina-Melaragno-1.jpg" alt="Portico Chateau Jardin" class="img-main" loading="lazy">'
W '          <img src="assets/images/Harmonie-Lobby.png" alt="Lobby Chateau Jardin" class="img-accent" loading="lazy">'
W '        </div>'
W '        <div class="img-stat-bar">'
W '          <div class="stat"><strong>185&#8211;355m&#178;</strong><span>&#193;rea privativa</span></div>'
W '          <div class="stat-sep"></div>'
W '          <div class="stat"><strong>3&#8211;4</strong><span>Su&#237;tes</span></div>'
W '          <div class="stat-sep"></div>'
W '          <div class="stat"><strong>2026</strong><span>Lan&#231;amento</span></div>'
W '        </div>'
W '      </div>'
W '    </div>'
W '  </div>'
W '</section>'

# VIDEO
W '<section class="section-video" id="video">'
W '  <div class="video-overlay">'
W '    <span class="section-label light">O Filme</span>'
W '    <h2 class="video-title">Sinta o Ch&#226;teau Jardin</h2>'
W '    <p class="video-sub">Uma experi&#234;ncia visual do mais sofisticado lan&#231;amento do Cidade Jardim</p>'
W '    <button class="btn-play" onclick="openModal(''modal-video'')" aria-label="Assistir ao video">'
W '      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>'
W '    </button>'
W '  </div>'
W '</section>'

# GALERIA
W '<section class="section galeria" id="galeria">'
W '  <div class="container">'
W '    <span class="section-label reveal">Perspectivas</span>'
W '    <h2 class="section-title center reveal">Um cen&#225;rio que inspira a cada olhar</h2>'
W '  </div>'
W '  <div class="carousel-wrapper reveal">'
W '    <div class="carousel-track" id="galTrack">'
W '      <div class="carousel-item"><img src="assets/images/Chateau-Jardin-Vista-aerea-do-lazer-1.jpg" alt="Vista aerea do lazer" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Chateau-Jardin-Vista-aerea-do-lazer-3.jpg" alt="Vista aerea angulo 2" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Harmonie-Fachada-1920x1200_c.jpg" alt="Fachada Chateau Jardin" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Harmonie-Portico-Alto-padrao-construtivo-com-design-e-arquitetura-classica-com-projeto-assinado-por-Dina-Melaragno-2-1.jpg" alt="Portico arquitetura classica" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Harmonie-Vista-lateral-da-fachada-1920x1200_c.jpg" alt="Vista lateral da fachada" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Harmonie-Lobby-2.png" alt="Lobby Chateau Jardin" loading="lazy"></div>'
W '      <div class="carousel-item"><img src="assets/images/Chateau-Jardin-Vista-aerea-do-lazer-2-2.jpg" alt="Vista aerea lazer angulo 3" loading="lazy"></div>'
W '    </div>'
W '    <button class="carousel-btn prev" onclick="moveCarousel(''galTrack'',''prev'')" aria-label="Anterior">&#8249;</button>'
W '    <button class="carousel-btn next" onclick="moveCarousel(''galTrack'',''next'')" aria-label="Proximo">&#8250;</button>'
W '  </div>'
W '</section>'

# LAZER
W '<section class="section lazer" id="lazer">'
W '  <div class="container">'
W '    <span class="section-label light reveal">Resort Privativo</span>'
W '    <h2 class="section-title light center reveal">&#193;reas de Lazer</h2>'
W '    <p class="section-sub light center reveal">Um clube privativo completo para voc&#234; e sua fam&#237;lia</p>'
W '    <div class="lazer-hero-img reveal">'
W '      <img src="assets/images/Chateau-Jardin-Vista-aerea-do-lazer-2-2.jpg" alt="Vista aerea das areas de lazer" loading="lazy">'
W '    </div>'
W '    <div class="lazer-grid reveal">'

$lazers = @(
  @{cat="Le Court"; title="Quadra de T&#234;nis de Saibro"; img="Harmonie-Quadra-de-Tenis-de-saibro-1920x1200_c.jpg"; modal_img="Harmonie-Quadra-de-Tenis-de-saibro.jpg"; desc="Quadra de t&#234;nis de saibro com Club Tennis &#8212; padr&#227;o internacional. Manuten&#231;&#227;o arcada pelas incorporadoras no 1&#186; ano."},
  @{cat="Esporte"; title="Quadra de Padel"; img="Harmonie-Quadra-de-padel.jpg"; modal_img="Harmonie-Quadra-de-padel.jpg"; desc="Quadra de padel profissional em &#225;rea coberta, perfeita para partidas com amigos e fam&#237;lia."},
  @{cat="Aqu&#225;tico"; title="Piscina Descoberta e Sol&#225;rio"; img="Harmonie-Piscina-descoberta-piscina-infantil-deck-molhado-e-solario.jpg"; modal_img="Harmonie-Piscina-descoberta-piscina-infantil-deck-molhado-e-solario.jpg"; desc="Piscina descoberta com piscina infantil integrada, deck molhado e amplo sol&#225;rio &#8212; ambiente resort de alto padr&#227;o."},
  @{cat="Aqu&#225;tico"; title="Piscina Coberta 25m com Raia"; img="Harmonie-Piscina-coberta-de-25m-com-raia.png"; modal_img="Harmonie-Piscina-coberta-de-25m-com-raia.png"; desc="Piscina coberta de 25m com raia &#8212; ideal para treinos regulares durante todo o ano."},
  @{cat="Les Salons"; title="Sal&#227;o de Festas e Lounges"; img="Harmonie-Salao-de-festas-e-lounges.png"; modal_img="Harmonie-Salao-de-festas-e-lounges.png"; desc="Sal&#245;es de festas e lounges com acabamento de alto padr&#227;o para receber com elegan&#231;a."},
  @{cat="Wellness"; title="Wellness Spa e Hidromassagem"; img="Harmonie-Wellness-Spa-com-hidromassagem.png"; modal_img="Harmonie-Wellness-Spa-com-hidromassagem.png"; desc="Wellness Spa com hidromassagem e sauna &#250;mida &#8212; um ref&#250;gio de bem-estar a poucos passos do seu apartamento."},
  @{cat="Beauty"; title="Espa&#231;o Beauty"; img="Harmonie-Espaco-beauty.png"; modal_img="Harmonie-Espaco-beauty.png"; desc="Espa&#231;o Beauty com sala de massagem &#8212; cuidar-se sem sair de casa."},
  @{cat="La Famille"; title="Brinquedoteca"; img="Harmonie-Brinquedoteca.png"; modal_img="Harmonie-Brinquedoteca.png"; desc="La Famille &#8212; brinquedoteca tem&#225;tica desenhada para estimular a criatividade das crian&#231;as."},
  @{cat="Infantil"; title="Playground Externo"; img="Harmonie-Playground.jpg"; modal_img="Harmonie-Playground.jpg"; desc="Playground externo em &#225;rea verde generosa &#8212; espa&#231;o para as crian&#231;as com seguran&#231;a e liberdade."},
  @{cat="Pet"; title="Pet Place e Campo Gramado"; img="Harmonie-Pet-place-Campo-gramado.jpg"; modal_img="Harmonie-Pet-place-Campo-gramado.jpg"; desc="Pet place com campo gramado e &#225;rea de banho coberta &#8212; porque seu melhor amigo merece o mesmo conforto."},
  @{cat="Le Calme"; title="Lobby de Alto Padr&#227;o"; img="Harmonie-Lobby-2.png"; modal_img="Harmonie-Lobby.png"; desc="Lobby com acabamentos nobres e design assinado &#8212; a primeira impress&#227;o que reflete todo o padr&#227;o Ch&#226;teau Jardin."},
  @{cat="Le Parc"; title="Pra&#231;as e Paisagismo"; img="Harmonie-Praca.jpg"; modal_img="Harmonie-Praca.jpg"; desc="Le Parc &#8212; pra&#231;as generosas com paisagismo assinado. Um convite ao sil&#234;ncio e &#224; contempla&#231;&#227;o."}
)

foreach ($l in $lazers) {
  W "      <div class=""lazer-card"" onclick=""openLazerModal('$($l.cat)','$($l.title)','assets/images/$($l.modal_img)','$($l.desc)')"">"
  W "        <div class=""lazer-img""><img src=""assets/images/$($l.img)"" alt=""$($l.title)"" loading=""lazy""></div>"
  W "        <div class=""lazer-info""><span class=""lazer-cat"">$($l.cat)</span><h3>$($l.title)</h3></div>"
  W "      </div>"
}

W '    </div>'
W '  </div>'
W '</section>'

# AMBIENTES
W '<section class="section ambientes" id="ambientes">'
W '  <div class="container">'
W '    <span class="section-label reveal">Apartamento Decorado</span>'
W '    <h2 class="section-title reveal">Ambientes sofisticados<br>pensados para o bem-estar</h2>'
W '    <p class="section-sub reveal">Amplos, com ventila&#231;&#227;o e ilumina&#231;&#227;o natural. Terra&#231;o nivelado com a sala. Design autoral e conforto pleno.</p>'
W '  </div>'
W '  <div class="carousel-wrapper reveal">'
W '    <div class="carousel-track tall-track" id="ambTrack">'
$ambImgs = @(
  @{f="CJ-decor-harmonie-86-1920x1200_c.jpg"; a="Sala de estar decorada"},
  @{f="CJ-decor-harmonie-77-1920x1200_c.jpg"; a="Sala de jantar decorada"},
  @{f="CJ-decor-harmonie-57-1920x1200_c.jpg"; a="Suite master decorada"},
  @{f="CJ-decor-harmonie-33-1920x1200_c.jpg"; a="Cozinha integrada decorada"},
  @{f="CJ-decor-harmonie-69-1920x1200_c.jpg"; a="Terraco panoramico"},
  @{f="CJ-decor-harmonie-10-1920x1200_c.jpg"; a="Banheiro suite master"},
  @{f="CJ-H-decor215-41-1920x1200_c.jpg"; a="Interior 215m2 decorado"},
  @{f="CJ-H-decor215-53-1920x1200_c.jpg"; a="Living 215m2 decorado"}
)
foreach ($ai in $ambImgs) {
  W "      <div class=""carousel-item""><img src=""assets/images/$($ai.f)"" alt=""$($ai.a)"" loading=""lazy""></div>"
}
W '    </div>'
W '    <button class="carousel-btn prev" onclick="moveCarousel(''ambTrack'',''prev'')" aria-label="Anterior">&#8249;</button>'
W '    <button class="carousel-btn next" onclick="moveCarousel(''ambTrack'',''next'')" aria-label="Proximo">&#8250;</button>'
W '  </div>'
W '</section>'

# DIFERENCIAIS
W '<section class="section diferenciais" id="diferenciais">'
W '  <div class="container">'
W '    <span class="section-label light reveal">Padr&#227;o Ch&#226;teau Jardin</span>'
W '    <h2 class="section-title light center reveal">Diferenciais Construtivos</h2>'
W '    <div class="dif-grid reveal">'
$difs = @(
  @{i="&#127959;"; t="Alto Padr&#227;o Construtivo"; d="Arquitetura cl&#225;ssica-atemporal com projeto assinado internacionalmente"},
  @{i="&#9889;"; t="Gerador Full"; d="Energia garantida para todas as unidades, &#225;reas comuns e seguran&#231;a"},
  @{i="&#128272;"; t="Hall Social Privativo"; d="Porta pivotante com fechadura social e biometria por unidade"},
  @{i="&#128733;"; t="C&#243;digo nos Elevadores"; d="Elevadores sociais com c&#243;digo de seguran&#231;a por andar &#8212; privacidade total"},
  @{i="&#10052;"; t="Infraestrutura AC"; d="Rede frigor&#237;fica no living, jantar, home theater e su&#237;tes"},
  @{i="&#129695;"; t="Caixilhos Especiais"; d="Alum&#237;nio cor p&#233;rola, persiana integrada e tratamento ac&#250;stico na su&#237;te master"},
  @{i="&#128225;"; t="Wi-Fi Maximizado"; d="Projeto de tecnologia para maximiza&#231;&#227;o do sinal em toda a unidade"},
  @{i="&#128247;"; t="Churrasqueira a G&#225;s"; d="Previs&#227;o para coifa e churrasqueira a g&#225;s no terra&#231;o"},
  @{i="&#128266;"; t="Isolamento Ac&#250;stico"; d="Isolamento entre pisos para amenizar ru&#237;dos de impacto"},
  @{i="&#128161;"; t="Ilumina&#231;&#227;o C&#234;nica"; d="Infraestrutura para ilumina&#231;&#227;o c&#234;nica no living e terra&#231;o"},
  @{i="&#128663;"; t="Garagem Alto Padr&#227;o"; d="Laje nervurada envernizada, piso granilite, paredes revestidas"},
  @{i="&#127968;"; t="&#193;reas Comuns Decoradas"; d="Todos os espa&#231;os comuns entregues decorados e mobiliados"}
)
foreach ($d in $difs) {
  W "      <div class=""dif-card""><div class=""dif-icon"">$($d.i)</div><h4>$($d.t)</h4><p>$($d.d)</p></div>"
}
W '    </div>'
W '  </div>'
W '</section>'

# TOUR VIRTUAL
W '<section class="section tour" id="tour">'
W '  <div class="container">'
W '    <span class="section-label reveal">Experi&#234;ncia Imersiva</span>'
W '    <h2 class="section-title center reveal">Tour Virtual 360&#176;</h2>'
W '    <p class="section-sub center reveal">Explore o Ch&#226;teau Jardin sem sair de onde voc&#234; est&#225;</p>'
W '    <div class="tour-frame reveal">'
W '      <iframe src="https://arquivos.tegraincorporadora.com.br/tour360/chateaujardin/" title="Tour Virtual 360 Chateau Jardin" frameborder="0" allowfullscreen loading="lazy"></iframe>'
W '      <div class="tour-overlay" id="tourOverlay" onclick="startTour()">'
W '        <div class="tour-play-btn"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 14.5v-9l6 4.5-6 4.5z"/></svg></div>'
W '        <p>Clique para iniciar o Tour Virtual 360&#176;</p>'
W '      </div>'
W '    </div>'
W '  </div>'
W '</section>'

# PLANTAS
W '<section class="section plantas" id="plantas">'
W '  <div class="container">'
W '    <span class="section-label reveal">Tipologias</span>'
W '    <h2 class="section-title center reveal">Plantas Personalizadas</h2>'
W '    <p class="section-sub center reveal">Para o seu estilo de vida &#8212; escolha a planta ideal e personalize com a equipe Signature</p>'
W '    <div class="plantas-grid reveal">'

$plantas = @(
  @{tipo="Harmonie"; m2="185"; suites="3 Su&#237;tes"; vagas="3 Vagas"; badge="Dispon&#237;vel"; cls=""; img1="Chateau-Jardin-Harmonie-185m%C2%B2-3-Suites-1.jpg"; img2="Chateau-Jardin-Harmonie-185m%C2%B2-3-Suites-Living-cozinha-e-terraco-integrados-1.jpg"; title="Harmonie 185m&#178;"; sub="3 Su&#237;tes"},
  @{tipo="Harmonie"; m2="215"; suites="3&#8211;4 Su&#237;tes"; vagas="4 Vagas"; badge="Mais Procurado"; cls=" featured"; img1="Chateau-Jardin-Harmonie-215m%C2%B2-3-Suites-Suite-master-e-banho-master-ampliados-Living-cozinha-e-terraco-integrados-1.jpg"; img2="Chateau-Jardin-Harmonie-215m%C2%B2-4-Suites-1.jpg"; title="Harmonie 215m&#178;"; sub="3&#8211;4 Su&#237;tes com Suite Master Ampliada"},
  @{tipo="Harmonie"; m2="248"; suites="4 Su&#237;tes"; vagas="4 Vagas"; badge="Dispon&#237;vel"; cls=""; img1="Chateau-Jardin-Harmonie-248m%C2%B2-4-Suites-1.jpg"; img2="Chateau-Jardin-Harmonie-248m%C2%B2-4-Suites-Living-cozinha-e-terraco-integrados-1.jpg"; title="Harmonie 248m&#178;"; sub="4 Su&#237;tes"},
  @{tipo="Lumi&#232;re"; m2="355"; suites="3&#8211;4 Su&#237;tes"; vagas="Office"; badge="Premium"; cls=" premium"; img1="Chateau-Jardin-Lumiere-355m%C2%B2-4-Suites.jpg"; img2="Chateau-Jardin-Lumiere-355m%C2%B2-3-Suites-Office-Cozinha-ampliada-Living-e-terraco-integrados.jpg"; title="Lumi&#232;re 355m&#178;"; sub="3&#8211;4 Su&#237;tes com Office"}
)

foreach ($p in $plantas) {
  $badgeCls = if ($p.badge -eq "Mais Procurado") { " destaque" } elseif ($p.badge -eq "Premium") { " premium-badge" } else { "" }
  W "      <div class=""planta-card$($p.cls)"" onclick=""openPlantaModal('$($p.title)','$($p.sub)','assets/images/$($p.img1)','assets/images/$($p.img2)')"">"
  W "        <div class=""planta-header""><span class=""planta-tipo"">$($p.tipo)</span><span class=""planta-badge$($badgeCls)"">$($p.badge)</span></div>"
  W "        <div class=""planta-metragem"">$($p.m2)<span>m&#178;</span></div>"
  W "        <div class=""planta-detalhes""><span>&#128716; $($p.suites)</span><span>&#128663; $($p.vagas)</span></div>"
  W "        <div class=""planta-thumb""><img src=""assets/images/$($p.img1)"" alt=""Planta $($p.tipo) $($p.m2)m2"" loading=""lazy""></div>"
  W "        <button class=""btn-planta"">Ver Planta Completa</button>"
  W "      </div>"
}

W '    </div>'
W '    <div class="plantas-cta reveal">'
W '      <p>Quer personalizar sua planta? Nossa equipe de arquitetura est&#225; &#224; disposi&#231;&#227;o.</p>'
W '      <button class="btn-primary" onclick="openModal(''modal-visita'')">Falar com Especialista</button>'
W '    </div>'
W '  </div>'
W '</section>'

# SIGNATURE
W '<section class="section signature" id="signature">'
W '  <div class="signature-bg"><img src="assets/images/CJ-decor-harmonie-1-2-1920x1200_c.jpg" alt="Ambiente Signature Chateau Jardin" loading="lazy"></div>'
W '  <div class="signature-overlay">'
W '    <div class="container">'
W '      <div class="signature-content reveal">'
W '        <span class="section-label light">Exclusividade Total</span>'
W '        <h2 class="signature-title">CH&#194;TEAU JARDIN<br><em>SIGNATURE</em></h2>'
W '        <p class="signature-sub">Exclusividade e conforto sob medida. Um servi&#231;o &#250;nico de personaliza&#231;&#227;o que transforma seu apartamento em uma experi&#234;ncia verdadeiramente autoral.</p>'
W '        <div class="signature-benefits">'
W '          <div class="sig-benefit"><span class="sig-check">&#10003;</span><div><strong>Atendimento Individual Presencial</strong><p>Assist&#234;ncia exclusiva do time de arquitetura das incorporadoras</p></div></div>'
W '          <div class="sig-benefit"><span class="sig-check">&#10003;</span><div><strong>Escolha ou Mescla de Plantas</strong><p>Defini&#231;&#227;o entre plantas pr&#233;-definidas ou mescla de ambientes, sem &#244;nus</p></div></div>'
W '          <div class="sig-benefit"><span class="sig-check">&#10003;</span><div><strong>Ajustes Exclusivos de Acabamento</strong><p>Possibilidade de ajustes em alvenarias, pisos e revestimentos</p></div></div>'
W '          <div class="sig-benefit"><span class="sig-check">&#10003;</span><div><strong>Servi&#231;os de Alto Padr&#227;o Inclusos</strong><p>Courrier, Concierge e manuten&#231;&#227;o da quadra de saibro arcados pela incorporadora*</p></div></div>'
W '        </div>'
W '        <button class="btn-hero-primary" onclick="openModal(''modal-visita'')">Conhecer o Programa Signature</button>'
W '      </div>'
W '    </div>'
W '  </div>'
W '</section>'

# LOCALIZACAO
W '<section class="section localizacao" id="localizacao">'
W '  <div class="container">'
W '    <span class="section-label reveal">Endere&#231;o</span>'
W '    <h2 class="section-title reveal">O Novo Eixo Cidade Jardim</h2>'
W '    <p class="section-sub reveal">Um marco residencial em S&#227;o Paulo, a poucos metros dos melhores destinos da cidade.</p>'
W '  </div>'
W '  <div class="loc-layout">'
W '    <div class="loc-map reveal">'
W '      <iframe src="https://maps.google.com/maps?q=R.+Min.+Nelson+Hungria%2C+400%2C+Cidade+Jardim%2C+S%C3%A3o+Paulo%2C+SP&t=m&z=15&output=embed&iwloc=near" title="Localizacao Chateau Jardin" frameborder="0" style="border:0" allowfullscreen loading="lazy"></iframe>'
W '    </div>'
W '    <div class="loc-info reveal">'
W '      <div class="loc-address-block">'
W '        <div class="loc-icon">&#128205;</div>'
W '        <div><strong>Ch&#226;teau Jardin</strong><p>R. Min. Nelson Hungria, 400<br>Cidade Jardim &#8211; S&#227;o Paulo, SP<br>CEP 05690-050</p></div>'
W '      </div>'
W '      <div class="loc-btns">'
W '        <a href="https://www.google.com/maps/search/R.+Min.+Nelson+Hungria%2C+400+Cidade+Jardim+SP" target="_blank" rel="noopener" class="btn-maps gmaps">&#128506; Abrir no Google Maps</a>'
W '      </div>'
W '      <div class="loc-region-imgs">'
W '        <img src="assets/images/cidade-jardim.jpg" alt="Cidade Jardim Sao Paulo" loading="lazy">'
W '        <img src="assets/images/Ponte-Estaiada.jpg" alt="Ponte Estaiada Sao Paulo" loading="lazy">'
W '      </div>'
W '    </div>'
W '  </div>'
W '</section>'

# PONTOS
W '<section class="section pontos" id="pontos">'
W '  <div class="container">'
W '    <span class="section-label reveal">Ao Redor</span>'
W '    <h2 class="section-title center reveal">Tudo que importa, perto de voc&#234;</h2>'
W '    <div class="pontos-grid reveal">'
W '      <div class="ponto-card"><img src="assets/images/Ponte-Estaiada.jpg" alt="Ponte Estaiada 500m" loading="lazy"><div class="ponto-info"><span class="ponto-cat">Marco Urbano</span><h3>Ponte Estaiada</h3><p>500m do empreendimento</p></div></div>'
W '      <div class="ponto-card"><img src="assets/images/Clube-Paineiras-Morumby.jpg" alt="Clube Paineiras 1,8km" loading="lazy"><div class="ponto-info"><span class="ponto-cat">Clube</span><h3>Clube Paineiras do Morumby</h3><p>1,8 km do empreendimento</p></div></div>'
W '      <div class="ponto-card"><img src="assets/images/Shopping-Cidade-Jardim.jpg" alt="Shopping Cidade Jardim" loading="lazy"><div class="ponto-info"><span class="ponto-cat">Compras &amp; Gastronomia</span><h3>Shopping Cidade Jardim</h3><p>Ao lado do empreendimento</p></div></div>'
W '      <div class="ponto-card"><img src="assets/images/Hospital-Israelita-Albert-Einstein.jpg" alt="Hospital Albert Einstein 2km" loading="lazy"><div class="ponto-info"><span class="ponto-cat">Sa&#250;de</span><h3>Hospital Albert Einstein</h3><p>2 km do empreendimento</p></div></div>'
W '    </div>'
W '  </div>'
W '</section>'

# PROXIMIDADE
W '<section class="section proximidade" id="proximidade">'
W '  <div class="container">'
W '    <span class="section-label light reveal">Conectividade</span>'
W '    <h2 class="section-title light center reveal">Listas de Proximidade</h2>'
W '    <div class="prox-grid reveal">'
W '      <div class="prox-col"><h3>&#128739; Conex&#245;es e Acessos</h3><ul>'
W '        <li><span>Av. Morumbi</span><strong>250 m</strong></li>'
W '        <li><span>Ponte do Morumbi</span><strong>300 m</strong></li>'
W '        <li><span>Ponte Estaiada</span><strong>500 m</strong></li>'
W '        <li><span>Marginal Pinheiros</span><strong>200 m</strong></li>'
W '        <li><span>Av. Chucri Zaidan</span><strong>600 m</strong></li>'
W '        <li><span>Av. Eng. Lu&#237;s Carlos Berrini</span><strong>800 m</strong></li>'
W '        <li><span>Aeroporto de Congonhas</span><strong>4,3 km</strong></li>'
W '      </ul></div>'
W '      <div class="prox-col"><h3>&#128218; Escolas</h3><ul>'
W '        <li><span>Col&#233;gio Franciscano Pio XII</span><strong>1 km</strong></li>'
W '        <li><span>Avenues School</span><strong>1,1 km</strong></li>'
W '        <li><span>Col&#233;gio Santo Am&#233;rico</span><strong>2,7 km</strong></li>'
W '        <li><span>British College of Brazil</span><strong>2,7 km</strong></li>'
W '        <li><span>Col&#233;gio Miguel de Cervantes</span><strong>2,8 km</strong></li>'
W '        <li><span>Escola Cidade Jardim | PlayPen</span><strong>3,2 km</strong></li>'
W '      </ul></div>'
W '      <div class="prox-col"><h3>&#127795; Parques e Clubes</h3><ul>'
W '        <li><span>Pra&#231;a Vin&#237;cius de Moraes</span><strong>1,7 km</strong></li>'
W '        <li><span>Clube Paineiras do Morumby</span><strong>1,8 km</strong></li>'
W '        <li><span>S&#227;o Paulo Futebol Clube</span><strong>2 km</strong></li>'
W '        <li><span>Parque Linear Bruno Covas</span><strong>2 km</strong></li>'
W '        <li><span>Parque Burle Marx</span><strong>2,3 km</strong></li>'
W '      </ul></div>'
W '      <div class="prox-col"><h3>&#127973; Hospitais</h3><ul>'
W '        <li><span>Hospital Sancta Maggiore</span><strong>200 m</strong></li>'
W '        <li><span>Hospital Albert Einstein</span><strong>2 km</strong></li>'
W '        <li><span>Fut. Hosp. S&#237;rio-Liban&#234;s</span><strong>1,4 km</strong></li>'
W '        <li><span>Hospital S&#227;o Luiz Morumbi</span><strong>2,6 km</strong></li>'
W '        <li><span>Fut. Unidade Albert Einstein</span><strong>1,4 km</strong></li>'
W '      </ul></div>'
W '    </div>'
W '  </div>'
W '</section>'

# CONTATO
W '<section class="section contato" id="contato">'
W '  <div class="container">'
W '    <div class="contato-grid">'
W '      <div class="contato-left reveal">'
W '        <span class="section-label">Exclusividade com hora marcada</span>'
W '        <h2 class="contato-title">Reserve sua visita<br>particular agora</h2>'
W '        <p>Nossa equipe especializada est&#225; pronta para apresentar cada detalhe do Ch&#226;teau Jardin em uma visita exclusiva e personalizada.</p>'
W '        <div class="contato-beneficios">'
W '          <div class="cb-item"><span>&#10003;</span>Visita particular sem pressa</div>'
W '          <div class="cb-item"><span>&#10003;</span>Apresenta&#231;&#227;o do apartamento decorado</div>'
W '          <div class="cb-item"><span>&#10003;</span>Simula&#231;&#227;o de financiamento personalizada</div>'
W '          <div class="cb-item"><span>&#10003;</span>Atendimento do especialista Ch&#226;teau Jardin</div>'
W '        </div>'
W '        <div class="contato-social">'
W '          <p>Ou fale diretamente conosco:</p>'
W '          <a href="tel:+551147102220" class="social-link phone">&#9742; (11) 4710-2220</a>'
W '          <a href="https://wa.me/551147102220?text=Ol%C3%A1%21+Gostaria+de+agendar+uma+visita+ao+Ch%C3%A2teau+Jardin." target="_blank" rel="noopener" class="social-link whatsapp">&#128172; WhatsApp</a>'
W '        </div>'
W '      </div>'
W '      <div class="contato-form-wrap reveal">'
W '        <form class="contato-form" id="formContato" onsubmit="handleSubmit(event,''contato'')">'
W '          <div class="form-header"><h3>Agende sua Visita</h3><p>Resposta em at&#233; 1 hora &#250;til</p></div>'
W '          <div class="form-group"><label for="c-nome">Nome completo *</label><input type="text" id="c-nome" name="nome" placeholder="Seu nome" required></div>'
W '          <div class="form-row two">'
W '            <div class="form-group"><label for="c-email">E-mail *</label><input type="email" id="c-email" name="email" placeholder="seu@email.com" required></div>'
W '            <div class="form-group"><label for="c-tel">Telefone / WhatsApp *</label><input type="tel" id="c-tel" name="telefone" placeholder="(11) 99999-9999" required></div>'
W '          </div>'
W '          <div class="form-group"><label for="c-int">Tipologia de interesse</label>'
W '            <select id="c-int"><option value="">Selecione...</option><option value="h185">Harmonie 185m&#178; &#8211; 3 Su&#237;tes</option><option value="h215">Harmonie 215m&#178; &#8211; 3/4 Su&#237;tes</option><option value="h248">Harmonie 248m&#178; &#8211; 4 Su&#237;tes</option><option value="l355">Lumi&#232;re 355m&#178; &#8211; Premium</option></select>'
W '          </div>'
W '          <div class="form-group"><label for="c-msg">Mensagem</label><textarea id="c-msg" rows="3" placeholder="Quando prefere visitar? Alguma d&#250;vida?"></textarea></div>'
W '          <div class="form-check"><input type="checkbox" id="c-lgpd" required><label for="c-lgpd">Autorizo contato conforme a <button type="button" onclick="openModal(''modal-privacidade'')" class="link-privacy">Pol&#237;tica de Privacidade</button>.</label></div>'
W '          <button type="submit" class="btn-submit">Agendar Minha Visita &#8594;</button>'
W '        </form>'
W '      </div>'
W '    </div>'
W '  </div>'
W '</section>'

# OUTROS
W '<section class="section outros" id="outros">'
W '  <div class="container">'
W '    <span class="section-label reveal">Portf&#243;lio Selecionado</span>'
W '    <h2 class="section-title center reveal">Conhe&#231;a outros empreendimentos</h2>'
W '    <div class="outros-wrap reveal">'
W '      <div class="outros-track" id="outrosTrack">'
$outros = @(
  @{img="Palm-Collection-Piscina-com-raia-de-20m-1-scaled.jpg"; bairro="Morumbi · São Paulo"; nome="Palm Collection"; desc="Piscina de raia 20m · Alto padrão"},
  @{img="14-THE-VIEW-EMPREENDIMENTO-DESKTOP.jpg"; bairro="São Paulo"; nome="The View"; desc="Vista panorâmica · Design contemporâneo"},
  @{img="PERSPECTIVAS-SPLEND-DESKTOP-23.jpg"; bairro="São Paulo"; nome="Splend"; desc="Perspectivas exclusivas · Alto padrão"},
  @{img="EMPREENDIMENTO-ONLY-DESKTOP-14.jpg"; bairro="São Paulo"; nome="Only"; desc="Exclusividade · Padrão premium"},
  @{img="20-Detalhe-da-fachada.jpg"; bairro="São Paulo"; nome="Harmonie"; desc="Arquitetura clássica · Acabamentos nobres"}
)
foreach ($o in $outros) {
  W "        <div class=""outro-card""><img src=""assets/images/$($o.img)"" alt=""$($o.nome)"" loading=""lazy""><div class=""outro-info""><span class=""outro-bairro"">$($o.bairro)</span><h3>$($o.nome)</h3><p>$($o.desc)</p><button class=""btn-outline-sm"" onclick=""openModal('modal-visita')"">Saiba Mais</button></div></div>"
}
W '      </div>'
W '      <button class="outros-btn prev" onclick="scrollOutros(''prev'')" aria-label="Anterior">&#8249;</button>'
W '      <button class="outros-btn next" onclick="scrollOutros(''next'')" aria-label="Proximo">&#8250;</button>'
W '    </div>'
W '  </div>'
W '</section>'

# FOOTER
W '<footer class="site-footer">'
W '  <div class="footer-top"><div class="container"><div class="footer-grid">'
W '    <div class="footer-brand">'
W '      <span class="logo-text">CH&#194;TEAU <em>JARDIN</em></span>'
W '      <p>O mais sofisticado lan&#231;amento do Novo Eixo Cidade Jardim. Arquitetura cl&#225;ssica-atemporal com leveza contempor&#226;nea.</p>'
W '      <div class="footer-socials">'
W '        <a href="https://wa.me/5511969155717" target="_blank" rel="noopener" class="fs-link">WA</a>'
W '        <a href="tel:+5511969155717" class="fs-link">TEL</a>'
W '      </div>'
W '    </div>'
W '    <div class="footer-col"><h4>Quero Im&#243;veis J&#225;</h4><ul>'
W '      <li><span style="font-size:0.85rem;color:var(--gold);font-weight:600;">CRECI 037234-J</span></li>'
W '      <li><a href="#sobre">Atendimento Personalizado</a></li>'
W '      <li><a href="https://wa.me/5511969155717" target="_blank" rel="noopener">WhatsApp Direto</a></li>'
W '      <li><a href="#plantas">Plantas e Tipologias</a></li>'
W '      <li><a href="#outros">Portf&#243;lio</a></li>'
W '    </ul></div>'
W '    <div class="footer-col"><h4>Contato Oficial</h4><ul>'
W '      <li><a href="tel:+5511969155717">&#9742; (11) 96915-5717</a></li>'
W '      <li><a href="https://wa.me/5511969155717" target="_blank" rel="noopener">&#128172; WhatsApp Oficial</a></li>'
W '      <li><a href="mailto:contato@queroimoveisja.com.br">&#9993; contato@queroimoveisja.com.br</a></li>'
W '      <li>Atendimento com hora marcada<br>Cidade Jardim &#8211; SP</li>'
W '    </ul>'
W '    <button class="btn-footer-cta" onclick="openModal(''modal-visita'')">Agendar Visita</button></div>'
W '  </div></div></div>'
W '  <div class="footer-bottom"><div class="container">'
W '    <p class="footer-disclaimer">* Informa&#231;&#245;es preliminares sujeitas a modifica&#231;&#245;es. Imagens meramente ilustrativas. P&#225;gina de divulga&#231;&#227;o e consultoria pessoal da Quero Im&#243;veis J&#225; &#8211; CRECI 037234-J.</p>'
W '    <div class="footer-legal"><span>&#169; 2026 Quero Im&#243;veis J&#225; &#8211; CRECI 037234-J. Todos os direitos reservados.</span><button onclick="openModal(''modal-privacidade'')" class="link-privacy-footer">Pol&#237;tica de Privacidade</button></div>'
W '  </div></div>'
W '</footer>'

# FLUTUANTES
W '<div class="floating-btns">'
W '  <button class="float-btn wpp" onclick="openModal(''modal-wpp'')" aria-label="WhatsApp"><span class="float-icon">&#128172;</span><span>WhatsApp</span></button>'
W '  <button class="float-btn call" onclick="openModal(''modal-call'')" aria-label="Ligar"><span class="float-icon">&#9742;</span><span>Ligar</span></button>'
W '</div>'

# MODAIS
W '<div class="modal-overlay" id="modal-visita" onclick="closeModalOutside(event,this)"><div class="modal-box"><button class="modal-close" onclick="closeModal(''modal-visita'')">&#10005;</button>'
W '  <div class="modal-header"><span class="modal-label">Ch&#226;teau Jardin</span><h2>Agendar Visita Exclusiva</h2><p>Nossa equipe entra em contato em at&#233; 1 hora &#250;til.</p></div>'
W '  <form onsubmit="handleSubmit(event,''visita'')">'
W '    <div class="form-group"><label>Nome *</label><input type="text" name="nome" placeholder="Seu nome completo" required></div>'
W '    <div class="form-row two">'
W '      <div class="form-group"><label>E-mail *</label><input type="email" name="email" placeholder="seu@email.com" required></div>'
W '      <div class="form-group"><label>WhatsApp *</label><input type="tel" name="telefone" placeholder="(11) 99999-9999" required></div>'
W '    </div>'
W '    <div class="form-group"><label>Tipologia</label><select name="tipologia"><option value="Harmonie 185m²">Harmonie 185m&#178;</option><option value="Harmonie 215m²">Harmonie 215m&#178;</option><option value="Harmonie 248m²">Harmonie 248m&#178;</option><option value="Lumière 355m²">Lumi&#232;re 355m&#178;</option></select></div>'
W '    <div class="form-check"><input type="checkbox" id="m-lgpd" required><label for="m-lgpd">Autorizo contato conforme a Pol&#237;tica de Privacidade.</label></div>'
W '    <button type="submit" class="btn-submit">Confirmar Agendamento &#8594;</button>'
W '  </form>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-ficha" onclick="closeModalOutside(event,this)"><div class="modal-box modal-wide"><button class="modal-close" onclick="closeModal(''modal-ficha'')">&#10005;</button>'
W '  <div class="modal-header"><span class="modal-label">Especifica&#231;&#245;es</span><h2>Ficha T&#233;cnica &#8212; Ch&#226;teau Jardin</h2></div>'
W '  <div class="ficha-grid">'
W '    <div class="ficha-item"><strong>Empreendimento</strong><span>Ch&#226;teau Jardin</span></div>'
W '    <div class="ficha-item"><strong>Endere&#231;o</strong><span>R. Min. Nelson Hungria, 400 &#8211; Cidade Jardim, SP</span></div>'
W '    <div class="ficha-item"><strong>Arquitetura</strong><span>Internacional by EDSA</span></div>'
W '    <div class="ficha-item"><strong>Paisagismo</strong><span>EDSA / Beneditto Abudd</span></div>'
W '    <div class="ficha-item"><strong>Tipologias</strong><span>Harmonie: 185, 215, 248m&#178; | Lumi&#232;re: 355m&#178;</span></div>'
W '    <div class="ficha-item"><strong>Su&#237;tes</strong><span>3 a 4 su&#237;tes</span></div>'
W '    <div class="ficha-item"><strong>Consultoria</strong><span>Quero Im&#243;veis J&#225; &#8212; CRECI 037234-J</span></div>'
W '    <div class="ficha-item"><strong>&#193;reas Comuns</strong><span>Entregues completamente decoradas</span></div>'
W '    <div class="ficha-item"><strong>Hall Social</strong><span>Privativo com biometria por unidade</span></div>'
W '    <div class="ficha-item"><strong>Gerador</strong><span>Full &#8212; todas as unidades e &#225;reas comuns</span></div>'
W '    <div class="ficha-item"><strong>Quadra T&#234;nis</strong><span>Saibro com Club Tennis</span></div>'
W '    <div class="ficha-item"><strong>Piscinas</strong><span>Coberta 25m + Descoberta com sol&#225;rio</span></div>'
W '  </div>'
W '  <button class="btn-primary" onclick="closeModal(''modal-ficha'');openModal(''modal-visita'')">Agendar Visita</button>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-video" onclick="closeModalOutside(event,this)"><div class="modal-box modal-video"><button class="modal-close" onclick="closeModal(''modal-video'')">&#10005;</button>'
W '  <div class="video-embed-wrap">'
W '    <video id="local-video" controls playsinline preload="metadata">'
W '      <source src="assets/video/empreendimento.mp4" type="video/mp4">'
W '      Seu navegador n&#227;o suporta o elemento de v&#237;deo.'
W '    </video>'
W '  </div>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-wpp" onclick="closeModalOutside(event,this)"><div class="modal-box modal-compact"><button class="modal-close" onclick="closeModal(''modal-wpp'')">&#10005;</button>'
W '  <div class="modal-header wpp-header"><div class="wpp-icon">&#128172;</div><h2>Fale via WhatsApp</h2><p>Atendimento imediato com nosso especialista</p></div>'
W '  <form onsubmit="handleSubmitWpp(event)">'
W '    <div class="form-group"><label>Nome *</label><input type="text" id="wpp-nome" placeholder="Seu nome" required></div>'
W '    <div class="form-group"><label>Telefone *</label><input type="tel" id="wpp-tel" placeholder="(11) 99999-9999" required></div>'
W '    <button type="submit" class="btn-submit wpp-btn">Iniciar Conversa no WhatsApp</button>'
W '  </form>'
W '  <a href="https://wa.me/5511969155717?text=Ol%C3%A1%21+Tenho+interesse+no+Ch%C3%A2teau+Jardin." target="_blank" rel="noopener" class="wpp-direct">Abrir WhatsApp diretamente &#8594;</a>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-call" onclick="closeModalOutside(event,this)"><div class="modal-box modal-compact"><button class="modal-close" onclick="closeModal(''modal-call'')">&#10005;</button>'
W '  <div class="modal-header"><h2>Fale com Quero Im&#243;veis J&#225;</h2><p>Ligue agora ou solicite retorno:</p></div>'
W '  <div class="call-numbers">'
W '    <a href="tel:+5511969155717" class="call-link">&#9742; Telefone: (11) 96915-5717</a>'
W '    <a href="https://wa.me/5511969155717" target="_blank" rel="noopener" class="call-link">&#128172; WhatsApp: (11) 96915-5717</a>'
W '  </div>'
W '  <hr class="modal-divider">'
W '  <form onsubmit="handleSubmit(event,''ligacao'')">'
W '    <div class="form-group"><label>Deixe seu n&#250;mero para retorno:</label><input type="tel" name="telefone" placeholder="(11) 99999-9999" required></div>'
W '    <div class="form-group"><label>Seu nome:</label><input type="text" name="nome" placeholder="Seu nome completo" required></div>'
W '    <button type="submit" class="btn-submit">Solicitar Retorno de Chamada</button>'
W '  </form>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-lazer" onclick="closeModalOutside(event,this)"><div class="modal-box modal-lazer-detail"><button class="modal-close" onclick="closeModal(''modal-lazer'')">&#10005;</button>'
W '  <div class="lazer-modal-img"><img id="lazerModalImg" src="" alt=""></div>'
W '  <div class="lazer-modal-info"><span class="modal-label" id="lazerModalCat"></span><h2 id="lazerModalTitle"></h2><p id="lazerModalDesc"></p><button class="btn-primary" onclick="closeModal(''modal-lazer'');openModal(''modal-visita'')">Quero Conhecer Presencialmente</button></div>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-planta" onclick="closeModalOutside(event,this)"><div class="modal-box modal-planta-detail"><button class="modal-close" onclick="closeModal(''modal-planta'')">&#10005;</button>'
W '  <div class="modal-header"><span class="modal-label" id="plantaModalTipo"></span><h2 id="plantaModalTitle"></h2></div>'
W '  <div class="planta-modal-imgs" id="plantaModalImgs"></div>'
W '  <div class="planta-modal-cta"><button class="btn-primary" onclick="closeModal(''modal-planta'');openModal(''modal-visita'')">Agendar Visita para Esta Planta</button></div>'
W '</div></div>'

W '<div class="modal-overlay" id="modal-privacidade" onclick="closeModalOutside(event,this)"><div class="modal-box modal-wide scrollable"><button class="modal-close" onclick="closeModal(''modal-privacidade'')">&#10005;</button>'
W '  <div class="modal-header"><h2>Pol&#237;tica de Privacidade</h2></div>'
W '  <div class="privacy-content">'
W '    <p>A Quero Im&#243;veis J&#225; respeita a sua privacidade e est&#225; comprometida com a prote&#231;&#227;o de seus dados pessoais, em conformidade com a Lei Geral de Prote&#231;&#227;o de Dados Pessoais (Lei n&#186; 13.709/2018 &#8211; LGPD).</p>'
W '    <h4>Dados Coletados</h4><p>Coletamos nome, e-mail e telefone exclusivamente para fins de atendimento e consultoria imobili&#225;ria sobre o empreendimento Ch&#226;teau Jardin.</p>'
W '    <h4>Finalidade do Tratamento</h4><p>Atendimento exclusivo, consultoria personalizada e agendamento de visitas com hora marcada.</p>'
W '    <h4>Seus Direitos</h4><p>Voc&#234; pode solicitar acesso, corre&#231;&#227;o ou exclus&#227;o dos seus dados diretamente pelo WhatsApp.</p>'
W '    <h4>Contato Oficial</h4><p>Quero Im&#243;veis J&#225; | CRECI 037234-J | E-mail: contato@queroimoveisja.com.br | WhatsApp: (11) 96915-5717 | S&#227;o Paulo, SP</p>'
W '  </div>'
W '</div></div>'

W '<div class="toast" id="toast">'
W '  <div class="toast-icon">&#10003;</div>'
W '  <div class="toast-text"><strong>Recebemos seu contato!</strong><span>Nossa equipe retornar&#225; em at&#233; 1 hora &#250;til.</span></div>'
W '</div>'

W '<script src="app.js"></script>'
W '</body>'
W '</html>'

$out.Close()
Write-Host "index.html escrito: $([Math]::Round((Get-Item '$PSScriptRoot\index.html').Length/1024))KB"
