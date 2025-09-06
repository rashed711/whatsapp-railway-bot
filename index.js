
const express = require('express');
const { create } = require('venom-bot');
const QRCode = require('qrcode');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('WhatsApp bot is running');
});

create({
  session: 'session1',
  multidevice: true
}).then((client) => start(client))
  .catch((err) => console.error(err));

function start(client) {
  console.log('Bot started!');
  client.onMessage((message) => {
    if (message.body === 'hi') {
      client.sendText(message.from, 'Hello from WhatsApp bot!');
    }
  });
}

// QR code handling
const qrPath = './qr.png';
QRCode.toFile(qrPath, 'QR_CODE_SAMPLE', { width: 300 }, (err) => {
  if (err) console.error(err);
  else console.log(`QR code saved at ${qrPath}`);
});

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
