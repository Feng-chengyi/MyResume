const fs = require('fs');
const c = fs.readFileSync('C:\\Users\\User\\.local\\share\\mimocode\\tool-output\\tool_eb9b422af0012MFCHEZQeJezha', 'utf8');
console.log('first 300:', c.substring(0, 300));
console.log('---');
console.log('last 500:', c.substring(c.length - 500));
