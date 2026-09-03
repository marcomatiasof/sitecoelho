/* ═══════════════════════════════════════════════════
   CHÂTEAU JARDIN — app.js
   Interações: hero slideshow, carousels, modais,
   scroll reveal, formulários, flutuantes
═══════════════════════════════════════════════════ */

// ─── HERO SLIDESHOW ───────────────────────────────
let currentSlide = 0;
const slides = document.querySelectorAll('.hero-slide');
const dots = document.querySelectorAll('.dot');
let slideInterval;

function goToSlide(index) {
  slides[currentSlide].classList.remove('active');
  dots[currentSlide].classList.remove('active');
  currentSlide = (index + slides.length) % slides.length;
  slides[currentSlide].classList.add('active');
  dots[currentSlide].classList.add('active');
}

function nextSlide() {
  goToSlide(currentSlide + 1);
}

function startSlideshow() {
  slideInterval = setInterval(nextSlide, 5000);
}

function stopSlideshow() {
  clearInterval(slideInterval);
}

// Pause on hover
const hero = document.getElementById('hero');
if (hero) {
  hero.addEventListener('mouseenter', stopSlideshow);
  hero.addEventListener('mouseleave', startSlideshow);
}

startSlideshow();

// ─── HEADER SCROLL ───────────────────────────────
const siteHeader = document.getElementById('site-header');
window.addEventListener('scroll', () => {
  if (window.scrollY > 60) {
    siteHeader.classList.add('scrolled');
  } else {
    siteHeader.classList.remove('scrolled');
  }
}, { passive: true });

// ─── MOBILE MENU ─────────────────────────────────
function toggleMenu() {
  const menu = document.getElementById('mobile-menu');
  const hamburger = document.getElementById('hamburger');
  menu.classList.toggle('open');
  hamburger.classList.toggle('open');
}

// Close mobile menu on outside click
document.addEventListener('click', (e) => {
  const menu = document.getElementById('mobile-menu');
  const hamburger = document.getElementById('hamburger');
  if (menu && menu.classList.contains('open')) {
    if (!menu.contains(e.target) && !hamburger.contains(e.target)) {
      menu.classList.remove('open');
      hamburger.classList.remove('open');
    }
  }
});

// ─── CAROUSELS ───────────────────────────────────
const carouselState = {};

function getCarouselConfig(trackId) {
  const track = document.getElementById(trackId);
  if (!track) return null;
  const items = track.querySelectorAll('.carousel-item');
  const itemWidth = items[0]?.offsetWidth || 0;
  const gap = 16; // 8px padding each side
  const slideWidth = itemWidth + gap;
  const total = items.length;
  if (!carouselState[trackId]) carouselState[trackId] = { pos: 0 };
  return { track, items, slideWidth, total };
}

function moveCarousel(trackId, direction) {
  const cfg = getCarouselConfig(trackId);
  if (!cfg) return;
  const { track, slideWidth, total } = cfg;
  const state = carouselState[trackId];
  const visibleCount = getVisibleItems(trackId);
  const maxPos = total - visibleCount;

  if (direction === 'next') {
    state.pos = state.pos >= maxPos ? 0 : state.pos + 1;
  } else {
    state.pos = state.pos <= 0 ? maxPos : state.pos - 1;
  }

  track.style.transform = `translateX(-${state.pos * slideWidth}px)`;
}

function getVisibleItems(trackId) {
  const w = window.innerWidth;
  if (trackId === 'galTrack' || trackId === 'ambTrack') {
    if (w < 768) return 1;
    if (w < 1024) return 2;
    return 3;
  }
  return 3;
}

// Auto-advance galeria carousel
setInterval(() => {
  if (document.getElementById('galTrack')) {
    moveCarousel('galTrack', 'next');
  }
}, 4000);

// ─── OUTROS EMPREENDIMENTOS CAROUSEL ────────────
function scrollOutros(direction) {
  const track = document.getElementById('outrosTrack');
  if (!track) return;
  const scrollAmt = 340;
  if (direction === 'next') {
    track.scrollBy({ left: scrollAmt, behavior: 'smooth' });
  } else {
    track.scrollBy({ left: -scrollAmt, behavior: 'smooth' });
  }
}

// ─── SCROLL REVEAL ───────────────────────────────
const revealObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      revealObserver.unobserve(entry.target);
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -60px 0px' });

document.querySelectorAll('.reveal').forEach((el) => {
  revealObserver.observe(el);
});

// ─── MODAIS ──────────────────────────────────────
function openModal(id) {
  const modal = document.getElementById(id);
  if (!modal) return;
  modal.classList.add('open');
  document.body.style.overflow = 'hidden';

  // Play video when modal opens
  if (id === 'modal-video') {
    const video = document.getElementById('local-video');
    if (video) {
      const playPromise = video.play();
      if (playPromise !== undefined) {
        playPromise.catch(() => {
          // Autoplay was prevented by browser policy; user can click play button on controls
        });
      }
    }
  }
}

function closeModal(id) {
  const modal = document.getElementById(id);
  if (!modal) return;
  modal.classList.remove('open');

  // Stop video when closing
  if (id === 'modal-video') {
    const video = document.getElementById('local-video');
    if (video) {
      video.pause();
    }
  }

  // Check if any other modal is open
  const openModals = document.querySelectorAll('.modal-overlay.open');
  if (openModals.length === 0) {
    document.body.style.overflow = '';
  }
}

function closeModalOutside(event, overlay) {
  if (event.target === overlay) {
    overlay.classList.remove('open');
    const openModals = document.querySelectorAll('.modal-overlay.open');
    if (openModals.length === 0) {
      document.body.style.overflow = '';
    }
  }
}

// ESC key closes modals
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    document.querySelectorAll('.modal-overlay.open').forEach((m) => {
      m.classList.remove('open');
    });
    document.body.style.overflow = '';
    const video = document.getElementById('local-video');
    if (video) video.pause();
  }
});

// ─── LAZER MODAL ────────────────────────────────
function openLazerModal(cat, title, imgSrc, desc) {
  document.getElementById('lazerModalCat').textContent = cat;
  document.getElementById('lazerModalTitle').textContent = title;
  document.getElementById('lazerModalDesc').textContent = desc;

  const img = document.getElementById('lazerModalImg');
  img.src = imgSrc;
  img.alt = title;

  openModal('modal-lazer');
}

// ─── PLANTA MODAL ────────────────────────────────
function openPlantaModal(tipo, sub, img1, img2) {
  document.getElementById('plantaModalTipo').textContent = tipo;
  document.getElementById('plantaModalTitle').textContent = sub;

  const container = document.getElementById('plantaModalImgs');
  container.innerHTML = '';

  [img1, img2].forEach((src, i) => {
    if (src) {
      const img = document.createElement('img');
      img.src = src;
      img.alt = `${tipo} - planta ${i + 1}`;
      img.loading = 'lazy';
      container.appendChild(img);
    }
  });

  openModal('modal-planta');
}

// ─── TOUR VIRTUAL ────────────────────────────────
function startTour() {
  const overlay = document.getElementById('tourOverlay');
  if (overlay) {
    overlay.classList.add('hidden');
  }
}

// ─── FORMULÁRIOS ────────────────────────────────
function handleSubmit(event, context) {
  event.preventDefault();
  const btn = event.target.querySelector('button[type=submit]');
  if (btn) {
    btn.textContent = 'Enviando...';
    btn.disabled = true;
  }

  // Simulate API call
  setTimeout(() => {
    event.target.reset();
    if (btn) {
      btn.textContent = 'Enviado!';
      setTimeout(() => {
        btn.textContent = context === 'visita' ? 'Confirmar Agendamento →' :
                          context === 'contato' ? 'Agendar Minha Visita →' :
                          'Solicitar Retorno de Chamada';
        btn.disabled = false;
      }, 2000);
    }

    // Close modal if it's the modal form
    if (context === 'visita' || context === 'ligacao') {
      setTimeout(() => closeModal(`modal-${context === 'visita' ? 'visita' : 'call'}`), 800);
    }

    showToast();
  }, 1200);
}

function handleSubmitWpp(event) {
  event.preventDefault();
  const nome = document.getElementById('wpp-nome')?.value || '';
  const tel = document.getElementById('wpp-tel')?.value || '';

  const msg = encodeURIComponent(
    `Olá, Coelho! Sou ${nome}, tenho interesse no Château Jardin. Meu telefone: ${tel}`
  );
  const url = `https://wa.me/5511996917883?text=${msg}`;

  setTimeout(() => {
    window.open(url, '_blank', 'noopener,noreferrer');
    closeModal('modal-wpp');
    event.target.reset();
  }, 400);
}

// ─── TOAST ───────────────────────────────────────
function showToast() {
  const toast = document.getElementById('toast');
  if (!toast) return;
  toast.classList.add('show');
  setTimeout(() => toast.classList.remove('show'), 4000);
}

// ─── SMOOTH ANCHOR SCROLL ────────────────────────
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
  anchor.addEventListener('click', function (e) {
    const href = this.getAttribute('href');
    if (href === '#') return;
    const target = document.querySelector(href);
    if (target) {
      e.preventDefault();
      const headerH = parseInt(getComputedStyle(document.documentElement)
        .getPropertyValue('--header-h'), 10) || 80;
      const top = target.getBoundingClientRect().top + window.scrollY - headerH;
      window.scrollTo({ top, behavior: 'smooth' });
    }
  });
});

// ─── ACTIVE NAV LINK ON SCROLL ───────────────────
const sections = document.querySelectorAll('section[id]');
const navLinks = document.querySelectorAll('.header-nav a');

const navObserver = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      navLinks.forEach((link) => link.classList.remove('active'));
      const active = document.querySelector(`.header-nav a[href="#${entry.target.id}"]`);
      if (active) active.classList.add('active');
    }
  });
}, { rootMargin: '-40% 0px -40% 0px' });

sections.forEach((s) => navObserver.observe(s));

// Add active nav link styling
const navStyle = document.createElement('style');
navStyle.textContent = '.header-nav a.active { color: var(--wine); background: rgba(107,31,42,0.08); }';
document.head.appendChild(navStyle);

// ─── PHONE MASK ──────────────────────────────────
function applyPhoneMask(input) {
  input.addEventListener('input', function () {
    let v = this.value.replace(/\D/g, '');
    if (v.length > 11) v = v.slice(0, 11);
    if (v.length <= 10) {
      v = v.replace(/(\d{2})(\d{4})(\d{0,4})/, '($1) $2-$3');
    } else {
      v = v.replace(/(\d{2})(\d{5})(\d{0,4})/, '($1) $2-$3');
    }
    this.value = v.replace(/-$/, '');
  });
}

document.querySelectorAll('input[type=tel]').forEach(applyPhoneMask);

// ─── PARALLAX ON HERO ─────────────────────────────
window.addEventListener('scroll', () => {
  const scrolled = window.scrollY;
  const heroContent = document.querySelector('.hero-content');
  if (heroContent && scrolled < window.innerHeight) {
    heroContent.style.transform = `translateY(${scrolled * 0.3}px)`;
    heroContent.style.opacity = 1 - scrolled / window.innerHeight;
  }
}, { passive: true });

// ─── IMAGEM FALLBACK ─────────────────────────────
document.querySelectorAll('img').forEach((img) => {
  img.addEventListener('error', function () {
    this.style.background = 'linear-gradient(135deg, #EDE9E2 0%, #C9A84C22 100%)';
    this.style.minHeight = '120px';
    this.removeEventListener('error', arguments.callee);
  });
});

// ─── INIT ─────────────────────────────────────────
console.log('🏛 Château Jardin — Landing Page Oficial');
console.log('👤 Consultoria: Corretor Coelho');
console.log('📞 Contato Oficial / WhatsApp: (11) 99691-7883');
