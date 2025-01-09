const express = require('express');
const app = express();
const port = 8080;

app.get('/api/message', (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.json({ message: 'Hello World' });
});

app.listen(port, () => {
  console.log(`Backend is running on port ${port}`);
});