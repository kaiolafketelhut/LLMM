const { spawn } = require('child_process');

const args = process.argv.slice(2);
const child = spawn('./dist/D16S', args, { stdio: 'inherit' });

child.on('error', (err) => {
    console.error('Failed to start D16S process:', err);
    process.exit(1);
});

child.on('close', (code) => {
    process.exit(code);
});
