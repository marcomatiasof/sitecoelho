const fs = require('fs');
const path = require('path');
const pdf = require('pdf-parse');

const pdfDir = path.join(__dirname, 'NÍVEL 2 PROMPTBOOK');
const files = fs.readdirSync(pdfDir).filter(f => f.endsWith('.pdf'));

async function extractAll() {
  let output = '';
  for (const file of files) {
    if (file.includes('O5') || file.includes('O3') || file.includes('O1') || file.includes('M1') || file.includes('M2') || file.includes('P3')) {
      const filePath = path.join(pdfDir, file);
      const buffer = fs.readFileSync(filePath);
      try {
        const data = await pdf(buffer);
        output += '\n\n===== ' + file + ' =====\n';
        output += data.text + '\n';
      } catch (e) {
        output += '\n\n===== ' + file + ' =====\n';
        output += 'ERRO: ' + e.message + '\n';
      }
    }
  }
  fs.writeFileSync('extracted_promptbook.txt', output);
  console.log('Extraction complete.');
}

extractAll().catch(console.error);
