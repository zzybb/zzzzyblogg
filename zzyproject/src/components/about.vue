<template>
  <div>
    <div class="aboutAll">
      <div class="Ta">
     <div class="tagCon">2017-04</div>
     <div class="trigl"></div>
      <p>对网页产生兴趣</p>
        </div>
      <div class="Ta" style="margin-left:370px;">
     <div class="tagCon">2017-07</div>
     <div class="trigl"></div>
        <p>入门前端</p>
        </div>
      <div class="Ta" style="margin-left:580px;">
     <div class="tagCon">2017-08</div>
     <div class="trigl"></div>
        <p>尝试自己的第一网站</p>
        </div>
      <div class="Ta" style="margin-left:780px;">
     <div class="tagCon">2017-09</div>
     <div class="trigl"></div>
        <p>自己的第二个作品</p>
        </div>
      <div class="Ta" style="margin-left:980px;">
     <div class="tagCon">2017-10</div>
     <div class="trigl"></div>
        <p>第一个个人博客</p>
        </div>
      
      <div class="line"></div>
      <i class="fa fa-arrow-circle-right" style="color:white;font-size:25px;margin-top:-8px;margin-left:180px;" v-for="item in 5"></i>
      <img  style="display:block;position:relative;top:80px;margin:0 auto;border-radius:20px;"src="http://oy2mxvmv9.bkt.clouddn.com/zed.jpg">
      <div class="justAbout">
        <span>废话连篇</span>
        <p>&nbsp;我是张兆仪。一个电子系的学渣，前端的入门新人。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作为一个曾经玩英雄联盟<strong>劫</strong>这个英雄的深度痴迷者，从S4开始一玩就是三年，不过依然只是一个白金.....
           曾经日思夜想，逃课也会去打的游戏在前年的某一天，每一个学渣都会出现的事：挂科数目太多了。我那时候才开始意识到
           这些东西并不能给我带来真正有用的价值，何况我是如此没有天赋T_T。我是电子信息系的，但是对硬件方面的一点兴趣也
           没有。实验课看着所谓正弦波&&方形波把我催眠，我开始寻找真正感兴趣的东西。</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在教务网上，看着那些5字，4字开头的成绩，也算是给我大学花上完美大叉。我就寻思，要是能改这些数据就好了(急中生智)，
           再联想起电视剧黑客的种种行为，我不由得陷入幻想。可是幻想归幻想，要付诸行动才有用。我就开始查各种各种乱七八糟
           关于黑客啊，入侵啊之类的关键字。结果当然是失败了(为此因为电脑中了病毒瘫痪重装了几次系统).....我还没入侵别人
           就被深刻教育并且明白了一个道理:根本不是我能搞得来得事...当然此举并不是没有收获，我终于知道网页大概是个什么
           鬼东西了。我觉得这是一个很神奇的事情，我只需要打开浏览器，保存源文件，改点字，就是我想要写的东西了，虽然
           只是我自己看看，但是对于一个只知道C语言printf("hello world!")的人来说，这种最最最最直接的视觉体验确确实实
           震撼到我了。</p>
        <p>我开始对计算机的一切感兴趣了，那时候是大三。</p>
        <p>我抱着一本外国佬写的《深入理解计算机原理》一书，晦涩难懂，尽管这是本大神都说是基础入门的书籍。同时看看
           HTML CSS  JS 就这样入了前端的坑</p>
        <span>关于博客</span>
        <p>前端：Vue + Animate.css + bootstrap</p>
        <p>后台：Node.js + mysql数据库 + express</p>
        <p>服务器:阿里云ECS</p>
        <p>图片外链：七牛云</p>
        <p>模板：ZZY模板1.0</p>
        <p>微信号：zzy576915249</p>
      </div>
  </div>
</div>
</template>
<script>
  export default {
    beforeCreate() {
      this.$store.commit('Loading');
      console.log(this.$store.state.loadingShow);
    },
    created() {
      this.$store.commit('Loading');
      console.log(this.$store.state.loadingShow);
    }
  }

    
  
</script>
<style>
  div.aboutAll{
    position:relative;
    top:50px;
    
    overflow:hidden;
    background-color:rgba(255, 255, 255,0.6);
    width:90%;
    margin:0 auto;
    margin-bottom:100px;
    padding-top:78px;
    border-radius:10px;
    z-index:-1;
  }
  div.line{
    position:absolute;
    left:2%;
    //margin:0 auto;
    width:96%;
    background-color:darkslateblue;
    height:13px;
    animation:ToRight 8s ease-in-out;
    z-index:-1;
  }
  .fa fa-arrow-circle-right{
    display:block;
  }
  div.Ta{
  position:absolute;
  top:2%;
  margin-left:16%;
}
div.tagCon{
  position:absolute;
  border-radius:5px;
  background-color:darkslateblue;
  font-size:smaller;
  padding:8px;
  color:white;
  width:70px;
}
div.trigl{
  position:absolute;
  width:0;
  height:0;
  border-width:8px;
  border-style:solid;
  border-color:darkslateblue transparent transparent transparent;
  margin-top:34px;
  margin-left:10px;
}
div.Ta p{
  margin-top:80px;
  font-size:small;
  
}
div.justAbout{
   margin-top:150px;
   margin-left:40px;
   margin-right:40px;
   margin-bottom:50px;
}
div.justAbout span{
  margin-top:30px;  
  margin-left:5px;
  margin-bottom:50px;
  display:inline-block;
  background-color:darkslateblue;
  color:white;
  font-size:30px;
  padding:10px;
  padding-right:20px;
  border-left:5px solid white;
}
  @keyframes ToRight{
    0%{
      width:0;
    }
    5%{
      width:3%;
    }
    10%{
      width:10%;
    }
    30%{
      width:20%;
    }
    40%{
      width:30%;
    }
    60%{
      width:60%;
    }
    80%{
      width:80%;
    }
    90%{
      width:95%;
    }
  }
</style>
