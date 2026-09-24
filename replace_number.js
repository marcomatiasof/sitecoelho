const fs = require('fs');
const path = require('path');

const dir = './';
const files = fs.readdirSync(dir).filter(f => f.endsWith('.html') || f.endsWith('.js') || f.endsWith('.ps1') || f.endsWith('.css'));

for (const file of files) {
    if (file === 'replace_number.js') continue;
    
    let content = fs.readFileSync(file, 'utf-8');
    let originalContent = content;

    // Replace unformatted numbers
    content = content.replace(/996917883/g, '950332503');
    content = content.replace(/969155717/g, '950332503');
    
    // Replace formatted numbers with hyphen
    content = content.replace(/99691-7883/g, '95033-2503');
    content = content.replace(/96915-5717/g, '95033-2503');

    if (content !== originalContent) {
        fs.writeFileSync(file, content);
        console.log(`Updated ${file}`);
    }
}
console.log('All files processed.');
