var express = require('express');
var router = express.Router();

const fetch = require('node-fetch');

router.get('/articles', (req, res) => {
  fetch('https://api-news-fake.vercel.app/articles')
    .then(response => response.json())
    .then(data => {
      if (data.status === 'ok') {
        res.json({ articles: data.articles });
      } else {
        res.json({ articles: [] });
      }
    });
});

module.exports = router;
