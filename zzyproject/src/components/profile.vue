<template>
<div>
<div class="webName" v-on:click="clickName">
     <h2 >ZZY</h2>
</div>
<div class="profile">
     <img v-bind:src="imgsrc" v-on:mouseenter="mouseoverImg"
                         v-on:mouseleave="mouseoutImg" v-on:click="aboutMe"   style="border-radius:50%" class="img"   />
    <div class="Tag" v-show="imgShow">
     <div class="tagCont">联系站长{{Tagmove()}}</div>
     <div class="trigle"></div>
    </div>
      <p></p>
      <span v-on:click="Lyb">留言</span>
      <span v-on:click="about">关于我</span>
</div>
  </div>
</template>
<script>
  import router from '.././router'
  export default {
    data() {
      return {
        imgsrc: "http://oy2mxvmv9.bkt.clouddn.com/lili.png",
        imgShow: false
      }
    },
    methods: {
      mouseoverImg: function (e) {
        var el = e.target;
        this.imgShow = true;
        $(el).toggleClass("animated wobble").addClass("animated tada");
        this.imgsrc = 'http://oy2mxvmv9.bkt.clouddn.com/lili2.png';
      },
      mouseoutImg: function (e) {
        var el = e.target;
        this.imgShow = false;
        $(el).toggleClass("animated tada").addClass("animated wobble");
        this.imgsrc = 'http://oy2mxvmv9.bkt.clouddn.com/lili.png'
      },
      clickName: function (e) {
        var el = e.target;
        $(el).addClass("animated bounceIn");
        var set = setInterval(function () {
          clearInterval(set);
          $(el).removeClass("animated bounceIn");
        }, 500);
      },
      Tagmove: function () {
        $(".img").mousemove(function (e) {
          var top = e.pageY - 120 + "px";
          var left = e.pageX - 90 + "px";
          $(".Tag").css({ "top": top, "left": left });
        })
      },
      about() {
        router.push("/about");
      },
      Lyb() {
        router.push("/lyb");
      },
      aboutMe() {
        alert("QQ：576915249   微信号：zzy576915249");
      }
    }
    
    }
  
</script>
<style>
div.webName{
    background-color:rgba(72, 0, 255,0.4);
    border-radius:10px;
    text-align:center;
    padding:40px;
    color:white;
    cursor:pointer;
}
div.profile{
    background-color:rgba(255, 255, 255,0.4);
    text-align:center;
    padding-top:20px;
    padding-bottom:30px;
}
div.profile span{
    display:inline-block;
    color:rgb(72, 0, 255);
    font-weight:900;
    padding:20px;
    cursor:pointer;
    border-radius:20px;
}
div.profile span:hover{
    color:white;
    background-color:darkcyan;
}
div.Tag{
  position:absolute;
}
div.tagCont{
  position:absolute;
  border-radius:5px;
  background-color:rgba(72, 0, 255,0.8);
  font-size:smaller;
  padding:8px;
  color:white;
  width:70px;
}
div.trigle{
  position:absolute;
  width:0;
  height:0;
  border-width:8px;
  border-style:solid;
  border-color:transparent transparent rgba(72,0,255,0.8) transparent;
  margin-top:-16px;
  margin-left:10px;
}

</style>
