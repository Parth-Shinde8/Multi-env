const http = require('http');

const PORT = 3000;
const VERSION = process.env.APP_VERSION || "v2";

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(`Hello from DevOps Platform \nVersion: ${VERSION}`);
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
process.exit(1);