let sql = require('../sql/sql');
let mysql = require('mysql');
let moment = require('moment');
let func = require('../sql/func');
let db = require('../configs/db');
let session = require('express-session');


let pool = mysql.createPool(db);

//捕获错误.
/*process.on('uncaughtException', function (err) {
    console.log('Caught exception: ' + err);
});*/


module.exports = {
    getlyb(req, res) {
        pool.getConnection((err, conn) => {
            var lybquery = 'SELECT * FROM ?? WHERE lyb=?'
            conn.query(lybquery, ["comment", "lyb"], (err, rows) => {
                res.json(rows);
                conn.release();
            })
                
        })
    },
    fetchGood(req, res) {
        if (req.session.Isgood != undefined) {
            console.log(req.session.Isgood);
        } else {
            req.session.Isgood = [];
            console.log(req.session.Isgood);
        }
        pool.getConnection((err, conn) => {
            var id = req.params.listNum + req.params.num;
            conn.query(sql.queryById, ['goods', id], (err, rows) => {
                if (err) throw err;
                res.json({ rows: rows, Isgood: req.session.Isgood });
                console.log({ rows: rows, Isgood: req.session.Isgood });
                conn.release();
            });
        });

    },
    UpdataGood(req, res) {
        pool.getConnection((err, conn) => {
            var num = req.body.good;
            var id = req.params.listNum + req.params.num; 
            req.session.Isgood[id] = true;
            var aquery = 'UPDATE goods SET good=? WHERE id=?';
            var bquery = 'UPDATE essay SET goods=? WHERE id=?';
            conn.query(aquery, [num, id], (err, rows) => {
                if (err) throw err;
                console.log("Update goods goods OK");
                
            });
            conn.query(bquery, [num, id], (err, rows) => {
                console.log("Update essay goods OK");
                
                res.send(200);
                conn.release();
            })

        })
    },
    getUser(req, res) {
        pool.getConnection((err, conn) => {
            console.log(req.session);
            conn.query(sql.queryAll, 'user', (err, rows) => {
                if (err) throw err;
                if (req.session.username != undefined) {
                    res.send({ username: req.session.username, usermail: req.session.usermail, Userdata: rows });
                } else {
                    res.json({ username: null, Userdata: rows });
                    console.log("NO username");
                }
                conn.release();
            })
        })
    },
    getComments(req, res) {
        pool.getConnection((err, conn) => {
            var id = req.params.listNum + req.params.num;
            conn.query('SELECT * FROM ?? WHERE art_id=?', ['comment', id], (err, rows) => {
                if (err) throw err;
                console.log("Accept comments OK");
                res.json(rows);
                conn.release();
            })
        })

    },
    UpdataUser(req, res) {
        pool.getConnection((err, conn) => {
            var userId = req.body.user;
            var mail = req.body.mail;
            var website = req.body.web;
            var id = req.params.listNum + req.params.num;
            req.session.username = userId;
            req.session.usermail = mail;
            queryUser = 'INSERT INTO user(name,mail,website) VALUES(?,?,?)';
            conn.query('SELECT * FROM ?? WHERE name=?', ['user', userId], (err, rows1) => {
                if (rows1[0] !== undefined) {
                    console.log(rows1[0].name + "is exsit");
                    conn.release();
                } else {
                    conn.query(queryUser, [userId, mail, website], (err, rows) => {
                        if (err) throw err;
                        console.log("User Updata OK");
                        conn.release();
                    });
                }
            });
            
        });
        pool.getConnection((err, conn) => {
            var userId = req.body.user;
            var mail = req.body.mail;
            var artId = req.body.artId;
            var comments = req.body.text;
            var commentLen = req.body.commentLen;
            var creatTime = req.body.creat_time;
            var parent_Id = req.body.parent_Id;
            var Tousername = req.body.Tousername;
            var commentsId = req.body.commentsId
            console.log(Tousername);
            console.log(commentsId);
            req.session.username = userId;
            req.session.usermail = mail;
            creatTime = moment().format('YYYY-MM-DD HH:mm:ss');
            
            queryCom = 'INSERT INTO comment(art_id,comments,creat_time,username,usermail,parent_Id,Tousername) VALUES(?,?,?,?,?,?,?)';
            
            conn.query(queryCom, [artId, comments, creatTime, userId, mail, parent_Id, Tousername], (err, rows) => {
                console.log(req.session);
                console.log("Comments Updata OK");
            });
            conn.query('UPDATE essay SET comments=? WHERE id=?', [commentLen, artId], (err, rows) => {
                console.log(req.session);
                res.send({ username: req.session.username, usermail: req.session.usermail });
                console.log("essay Comments Updata OK");
                conn.release();
            });
        })
    },
    Updatalyb(req, res) {
        pool.getConnection((err, conn) => {
            var userId = req.body.user;
            var mail = req.body.mail;
            var artId = req.body.artId;
            var comments = req.body.text;
            var website = req.body.web;
            var creatTime = req.body.creat_time;
            creatTime = moment().format('YYYY-MM-DD HH:mm:ss');
            queryCom = 'INSERT INTO comment(comments,creat_time,username,usermail,lyb) VALUES(?,?,?,?,?)';
            queryUser = 'INSERT INTO user(name,mail,website) VALUES(?,?,?)';
            conn.query(queryCom, [comments, creatTime, userId, mail, artId], (err, rows) => {
                console.log("lyb Updata OK");
            });
            conn.query('SELECT * FROM ?? WHERE name=?', ['user', userId], (err, rows1) => {
                if (rows1[0] !== undefined) {
                    console.log(rows1[0].name + "is exsit");
                    res.send(200);
                    conn.release();
                } else {
                    conn.query(queryUser, [userId, mail, website], (err, rows2) => {
                        if (err) throw err;
                        console.log("User Updata OK");
                        res.send(200);
                        conn.release();
                    });
                }
            });
        })
    },
    getEssay(req, res) {
        pool.getConnection((err, conn) => {
            var id = req.params.listNum + req.params.num;
            queryEssay = 'SELECT * FROM ?? WHERE id=?';
            conn.query(queryEssay, ["essay", id], (err, rows) => {
                res.json(rows);
                console.log("essay OK");
                conn.release();
            })
        })
    },
    allEssay(req, res) {
        pool.getConnection((err, conn) => {
            conn.query(sql.queryAll, "essay", (err, rows) => {
                res.json(rows);
                console.log("Allessay OK");
                conn.release();
            })
        })
    },
    getEssayTag(req, res) {
        pool.getConnection((err, conn) => {
            var Tag = req.params.string;
            queryEssay = 'SELECT * FROM ?? WHERE Tag=?';
            conn.query(queryEssay, ["essay", Tag], (err, rows) => {
                res.json(rows);
                console.log("essay OK");
                conn.release();
            })
        })
    }
}