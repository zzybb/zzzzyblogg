<template>
  <div>
    <div class="lyb">
      <p style="margin-top:20px;color:rgb(72,0,255);margin-left:55%;font-weight:700;">你，生命中最重要的过客，之所以是过客，因为你未曾为我停留。</p>
      <img src="http://oy2mxvmv9.bkt.clouddn.com/lili3.png">
       <div class="Tag2">
     <div class="tagCont2" >当您驻足停留过，从此便注定我们的缘分。站在时间的尽头，我们已是朋友，前端的路上我再也不用一个人独自行走。</div>
     <div class="trigle2" ></div>
    </div>
    <div class="comment">
      <div class="inputCom">
        <p>想听你说话</p>
      <textarea name="text" v-model="textarea"></textarea>
        <input type="button" value="提交评论" v-on:click="outCom">
        <h3>评论列表</h3>
        <span v-show="commentLen == 0" style="color:gray;">还没有留言！快来说点话吧！</span>
        <hr  style="width:95%;border-color:cadetblue" />
        <div class="com" v-for="(item,index) in allCom">
          <div class="com-left"></div>
          <div class="com-body">
             <span style="color:darkslategrey;font-weight:900;font-size:20px;margin-left:40px;margin-right:20px;"><i class="fa fa-user" style="margin-right:10px"></i>{{item.username}}</span>
             <span style="color:gray;font-weight:500;">{{item.creat_time | formats}}</span>
             <p>{{item.comments}}</p>
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
    </div>
</template>
<script>
  import moment from 'moment';
  import router from '.././router';
  export default {
    data() {
      return {
        comment: false,
        userId: null,
        userMail: null,
        userWeb: null,
        allCom: null,
        nameIsNull: false,
        textarea: null,
        commentLen: null
      }
    },
    beforeCreate() {
      this.$store.commit('Loading');
    },
    created() {
      this.$http.get("/lyb").then(function(res)  {
        this.allCom = res.body;
        this.commentLen = this.allCom.length;
        console.log(this.allCom);
        this.$store.commit('Loading');
        console.log(this.$store.state.loadingShow);
      })
    },
    methods: {
      outCom(){
        this.comment = true;
      },
      SendUser() {
        if (this.userId == null || this.userId == '' || this.userId.indexOf(" ") >= 0) {
          this.nameIsNull = true;
          return;
        } else if (this.textarea == null || this.textarea == '' || this.userId.indexOf(" ") >= 0) {
          alert("大哥评论怎么空了..");
          this.comment = false;
          return;
        }
        var user = $("input[name='user']").val();
        var mail = $("input[name='mail']").val();
        var web = $("input[name='web']").val();
        var text = $("textarea[name='text']").val();
        var artId = 'lyb';
        var creatTime = new Date();
        var self = this;
        this.$http.post("/lyb", {
          user: user,
          mail: mail,
          web: web,
          artId: artId,
          text: text,
          creat_time: creatTime
        }).then(res => {
          self.comment = false;
          $("textarea[name='text']").val("");
          this.$http.get("/lyb").then((res) => {
            this.allCom = res.body;
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
  div.lyb{
    overflow:hidden;
    margin:0 auto;
    background-color:rgba(255, 255, 255,0.6);
    width:80%;
    margin-top:50px;
    border-radius:20px;
  }
  div.lyb img{
    margin-top:20px;
    margin-left:50px;
    border-radius:50%;
  }
  div.Tag2{
  position:relative;
  left:25%;
  top:-100px;
}
div.tagCont2{
  position:absolute;
  border-radius:5px;
  background-color:rgba(72, 0, 255,0.8);
  font-size:smaller;
  padding:20px;
  color:white;
  width:400px;
}
div.trigle2{
  position:absolute;
  width:0;
  height:0;
  border-width:8px;
  border-style:solid;
  border-color:transparent rgba(72,0,255,0.8) transparent transparent;
  margin-top:10px;
  margin-left:-16px;
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
   .Session{
    position:fixed;
    //border:1px red solid;
    background-color:rgba(255,255,255,0.8);
    border-radius:8px;
    top:25%;
    left:40%;
    width:20%;
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

</style>

