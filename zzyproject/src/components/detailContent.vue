<template>
  <div class="all">
    <vue-markdown :source="essay"></vue-markdown>
    <div style="text-align:center;">
    <span class="fa fa-heart fa-lg animated" style="color:red;font-size:40px;cursor:pointer;margin-top:50px;"   v-on:click="good"   v-on:mouseenter="show =!show" v-bind:class="{bounceIn:show}" >&nbsp;{{goods}}</span>
    <transition 
                         name="custom-classes-transition"
                         enter-active-class="animated flipInX"
                         leave-active-class="animated flipOutX" mode="out-in">
    <span style="font-size:30px;color:crimson;display:inline-block;position:absolute;padding-left:10px;margin-top:-6px;" v-show="oneshow"> + 1</span>
      </transition>
      </div>
      
    <div class="comment">
      <div class="inputCom">
        <p>想听你说话</p>
        <div class="textposition" v-show="n == null && s == null">
      <textarea name="text" v-model="textarea"></textarea>
        <input type="button" value="提交评论" v-on:click="outComm">
          </div>
        <h3>评论列表</h3>
        <span v-show="commentLen == 0" style="color:gray;">还没有评论！快来说点话吧！</span>
        <hr  style="width:95%;border-color:cadetblue" />
        <div class="com" v-for="(item,index) in allCom" v-on:mouseenter="replyShow(index)" v-on:mouseleave="replyShow">
          <div class="com-body">
             <span style="color:darkslategrey;font-weight:900;font-size:20px;margin-left:40px;margin-right:20px;"><i class="fa fa-user" style="margin-right:10px"></i>{{item.username}}</span>
             <span style="color:gray;font-weight:500;">{{item.creat_time | formats}}</span><i class="fa fa-commenting" style="margin-left:20px;color:darkslateblue;cursor:pointer;" v-show="i==index" v-on:click="Showtext(item.username,item.commentsId,item.parent_Id,index)">&nbsp;回复</i>
             <p>{{item.comments}}</p>
          </div>
          <div class="textposition" v-show="n==index">
             <textarea name="text" v-model="textarea"></textarea>
             <input type="button" value="取消回复" v-on:click="Showtext" style="left:38%;">
             <input type="button" value="提交评论" v-on:click="outComm" style="left:38%;">
            </div>
             <div style="background-color:rgba(255,255,255,0.6);width:80%;margin:0 auto;border-radius:10px;">
               <template  v-for="(items,index2) in replyCom"  v-if="items.parent_Id.indexOf('/' + item.commentsId + '/') !== -1"  >
                 <div class="com2" v-on:mouseenter="replyShow2(index2)" v-on:mouseleave="replyShow2">
            <div class="com2-body" >
             <span style="color:darkslategrey;font-weight:900;font-size:20px;"><i class="fa fa-user" style="margin-right:10px"></i>{{items.username}}&nbsp;&nbsp;<span style="color:gray;">回复</span>&nbsp;&nbsp;{{items.Tousername}}</span>
             <span style="color:gray;font-weight:500;">{{items.creat_time | formats}}</span><i class="fa fa-commenting" style="margin-left:20px;color:darkslateblue;cursor:pointer;" v-show="r==index2" v-on:click="Showtext2(items.username,items.commentsId,items.parent_Id,index2)">&nbsp;回复</i><br/>
             <span>{{items.comments}}</span>
          </div>
            <div class="textposition" v-show="s==index2">
             <textarea name="text" v-model="textarea"></textarea>
             <input type="button" value="取消回复" v-on:click="Showtext" style="left:38%;">
             <input type="button" value="提交评论" v-on:click="outComm" style="left:38%;">
            </div>
          
          </div>
                 </template>
            </div>
          <hr />
        </div>
        
        </div>

    </div>
       <transition 
                         name="custom-classes-transition"
                         enter-active-class="animated fadeIn"
                         leave-active-class="animated fadeOut" mode="out-in" >
            <div class="Session" v-show="comment">
              <label for="" >昵称<span style="color:darkred">(必填)</span></label>
              <input type="text" v-model="userId"  v-on:blur="judgeInput"   name="user" placeholder="你的名字是..">
              <p style="margin:10px;color:red;" v-show="nameIsNull">昵称不能为空！</p>
              <label for="" >邮箱<span style="color:dimgray">(选填)</span></label>
              <input type="email" v-model="userMail" name="mail" placeholder="你的邮箱是..">
              <label for="">网址<span style="color:dimgrey">(选填)</span></label>
              <input type="text" v-model="userWeb" name="web" placeholder="我会回访~">
              <input type="button" value="发表评论" v-on:click="SendUser">
              <input type="button" value="关闭评论" style="float:right;" v-on:click="comment =!comment">
        </div>
         </transition>
    </div>
</template>
<script>
  import axios from "axios";
  import moment from 'moment';
  import router from '.././router';
  import VueMarkdown from 'vue-markdown';

  export default {
    props: ["sourceDedata"],
    data() {
      return {
        count: null,
        show: false,
        oneshow: false,
        goods: '',
        comment: false,
        commentLen: null,
        userId: null,
        userMail: null,
        userWeb: null,
        allCom: null,
        replyCom: null,
        Isgood: false,
        essay: '',
        nameIsNull: false,
        textarea: null,
        i: null,
        n: null,
        r: null,
        s:null,
        Tousername: null,
        parentId: null,
        allComment: null,
        Isreply:null
      }
    },
    created() {
      var Id = this.$route.path.slice(9, 10) + this.$route.path.slice(11, 12);
      var url = '/content/' + this.$route.path.slice(9, 10) + '/' + this.$route.path.slice(11, 12);
      var essayUrl = '/content/' + this.$route.path.slice(9, 10) + '/' + this.$route.path.slice(11, 12) + '/' + 'essay';
      var comments = url + '/' + "comments";
      var self = this;
      Promise.all(
        [this.$http.get(url), this.$http.get(comments), this.$http.get("/Login"), this.$http.get(essayUrl)]
      ).then(res => {
        this.essay = res[3].body[0].content;
        this.allCom = res[1].body.filter(function (res) {
          return res.parent_Id == null;
        });
        this.replyCom = res[1].body.filter(function (res) {
          return res.parent_Id !== null;
        });
        console.log(this.allCom.length);
        this.allComment = res[1].body;
        console.log(this.allCom.length);
        this.commentLen = this.allComment.length;
        this.goods = res[0].body.rows[0].good;
        this.Isgood = res[0].body.Isgood[Id];
        console.log("a");
        if (res[2].body.username != undefined) {
          this.userId = res[2].body.username;
          this.userMail = res[2].body.usermail;
        }
        this.allCom.sort(function (b, a) {
          return new Date(a.creat_time).getTime() - new Date(b.creat_time).getTime()
        });
        if (this.$store.state.loadingShow == true) {
          this.$store.commit('Loading');
        }
        }).catch(function(reason) {
          console.log(reason);
        })
    },
    components: {
      VueMarkdown
    },
    methods: {
      good() {
        if (!this.Isgood) {
          this.goods = this.goods + 1;
          this.Isgood = true;
          var url = '/content/' + this.$route.path.slice(9, 10) + '/' + this.$route.path.slice(11, 12);
          this.$http.post(url, { good: this.goods }).then(res => {
            console.log("send OK");
          });
          var self = this;
          this.oneshow = true;
          setInterval(function () {
            self.oneshow = false;
            clearInterval();
          }, 500)
        } else {
          alert("您已经参与过投票了！^_^");
        }
      },
      outComm() {
        this.comment = true;
      },
      SendUser() {
        if (this.userId == null || this.userId == '' || this.userId.indexOf(" ") >= 0) {
          this.nameIsNull = true;
          return;
        } else if (this.textarea == null || this.textarea == '' || this.userId.indexOf(" ")>=0  ) {
          alert("大哥评论怎么空了..");
          this.comment = false;
          return;
        }
        this.commentLen = this.commentLen + 1;
        var user = $("input[name='user']").val();
        var mail = $("input[name='mail']").val();
        var web = $("input[name='web']").val();
        var text = $("textarea[name='text']").val();
        var artId = this.$route.path.slice(9, 10) + this.$route.path.slice(11, 12);
        var creatTime = new Date();
        var self = this;
        var url = '/content/' + this.$route.path.slice(9, 10) + '/' + this.$route.path.slice(11, 12);
        var comments = url + '/' + "comments";
        this.$http.post("/Login", {
          user: user,
          mail: mail,
          web: web,
          artId: artId,
          text: text,
          commentLen: this.commentLen,
          creat_time: creatTime,
          parent_Id: this.parentId,
          Tousername: this.Tousername
        }).then(res => {
          self.comment = false;
          self.textarea = '';
          this.$http.get(comments).then((res) => {
            this.allComment = res.body;
            this.allCom =  res.body.filter(function (res) {
              return res.parent_Id == null;
            });
            this.replyCom =  res.body.filter(function (res) {
              return res.parent_Id !== null;
            });
            this.allCom.sort(function (b, a) {
              return new Date(a.creat_time).getTime() - new Date(b.creat_time).getTime()
            });
            console.log("Updata List OK");
            alert("评论成功！");
          });
        }).catch(reson => {
          alert("评论失败..");
        })
      },
      judgeInput() {
        if (this.userId == null || this.userId == '' || this.userId.indexOf(" ") >= 0) {
          this.nameIsNull = true;
        } else {
          this.nameIsNull = false;
        }
      },
      replyShow(index) {
        if (this.i !== null) {
          this.i = null;
          return;
        }
        this.i = index;
      },
      replyShow2(index) {
        if (this.r !== null) {
          this.r = null;
          return;
        }
        this.r = index;
      },
      Showtext(username, commentsId,parent_Id,index) {
        this.Tousername = username;
        console.log(parent_Id);
        if (parent_Id == null || '') {
          this.parentId = '/'+ commentsId + '/';
        } else {
          this.parentId = parent_Id  + commentsId + '/';
        }
        console.log(this.parentId);
        if (this.n !== null) {
          this.n = null;
          return;
        }
        else if (this.s !== null) {
          this.s = null;
          return;
        }
        this.n = this.i;
        this.s = this.r;
      },
      Showtext2(username, commentsId, parent_Id, index) {
        this.Tousername = username;
        console.log(parent_Id);
        if (parent_Id == null || '') {
          this.parentId = '/' + commentsId + '/';
        } else {
          this.parentId = parent_Id + commentsId + '/';
        }
        console.log(this.parentId);
         if (this.s !== null) {
          this.s = null;
          return;
        }
        this.s = this.r;
      }
    },
    filters: {
      formats: function (value) {
        value = moment(value).format("YYYY-MM-DD HH:mm:ss");
        return value;
      }
    }
  }
</script>
<style>
  div.all{
    background-color:rgba(255, 255, 255,0.6);
    border-radius:20px;
    margin:0 auto;
    width:80%;
    padding:50px;
    margin-top:100px;
  }
  div.detail{
    text-align:center;

  }
    div.comment{
    text-align:center;
    overflow:hidden;
    margin-top:20px;
  }
  div.inputCom{
    margin:40px;
    border:1px solid;
    border-color:steelblue;
    border-radius:10px;
    
  }
  .inputCom p{
    display:inline-block; 
    float:left;
    width:100%;
    font-weight:700;
    color:darkcyan;
    background-color:rgba(0, 148, 255,0.4);
    text-align:left;
    padding-left:10px;
    padding-top:10px;
    padding-bottom:10px;
  }
  .inputCom textarea{
    margin-top:10px;
    width:95%;
    height:200px;
    background-color:rgba(255, 255, 255,0.4);
    border:1px solid steelblue;
    border-radius:10px;
  }
  .inputCom input{
    position:relative;
    border-radius:5px;
    border:1px solid steelblue;
    background-color:steelblue;
    color:white;
    padding:10px;
    margin-bottom:20px;
    left:43%;
  }
  .inputCom h3{
      margin-left:-85%;
      color:cornflowerblue;
      
  }
  .Session{
    position:fixed;
    //border:1px red solid;
    background-color:rgba(255,255,255,0.8);
    border-radius:8px;
    padding:12px;
    top:25%;
    left:40%;
    width:25%;
  }
  .Session input{
     margin:6px;
  }
  .Session label{
    margin:10px;
  }
  .Session input[type=button]{
    background-color:cadetblue;
    border-radius:5px;
    padding:10px;
    border:none;
    color:white;
  }
  div.com{
    overflow:hidden;
  }

  .com-body{
    text-align:left;
    height:50px;
  }
  .com-body p{
    font-size:large;
    background-color:transparent;
    color:dimgrey;
    margin-left:50px;
  }
  .com hr{
    width:95%;
    border-top:1px solid grey;
  }
  .com:last-child hr{
    border-top:none;
  }
  div.com2{
    //border:1px red solid;
    text-align:left;
    margin-top:20px;
    margin-left:20px;
    padding:5px;
  }





</style>
