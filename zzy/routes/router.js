let express = require('express');
let goods = require('../controls/goods');
let api = require('../api');
let router = express.Router();

router.get('/lyb', goods.getlyb);
router.post('/lyb', goods.Updatalyb);
router.get('/essay', goods.allEssay);
router.get('/content/:listNum/:num/comments', goods.getComments);
router.get('/content/:listNum/:num/essay', goods.getEssay);
router.get('/content/:listNum/:num', goods.fetchGood);
router.get('/essay/:string', goods.getEssayTag);
router.post('/content/:listNum/:num', goods.UpdataGood);

router.get('/Login', goods.getUser);
router.post('/Login', goods.UpdataUser);
module.exports = router;