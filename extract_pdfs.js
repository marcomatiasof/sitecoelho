const fs = require('fs');
const path = require('path');
const pdf = require('pdf-parse');

const pdfDir = path.join(__dirname, 'PDF');
const files = fs.readdirSync(pdfDir).filter(f => f.endsWith('.pdf'));

async function extractAll() {
  for (const file of files) {
    const filePath = path.join(pdfDir, file);
    const buffer = fs.readFileSync(filePath);
    try {
      const data = await pdf(buffer);
      console.log('\n\n===== ' + file + ' =====');
      console.log('Páginas:', data.numpages);
      console.log('--- TEXTO ---');
      console.log(data.text);
    } catch (e) {
      console.log('\n\n===== ' + file + ' =====');
      console.log('ERRO:', e.message);
    }
  }
}

extractAll().catch(console.error);
