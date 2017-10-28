<template>
  <div>
    <transition
    name="custom-classes-transition"
    enter-active-class="animated flipInX"
    leave-active-class="animated fadeOut" mode="out-in"
  >
    <div class="secondNav" v-show="nav2Show">
      <div class="nav2">
        <a class="font-hei"  v-for="(item,index) in navlink" v-on:click="goto($event,index)" ref="link2">{{shiftNav()}}{{item.text}}</a>
      </div>
    </div>
      </transition>
      <transition
    name="custom-classes-transition"
    enter-active-class="animated bounce"
    leave-active-class="animated bounceOut" mode="out-in"
  >
  <div class="container-fluid header">
	<div class="row-fluid">
		<div class="span12">
        <h4 style="color:white">{{Time.during}}，欢迎来到<strong style="color:darkslateblue">ZZY</strong>的博客，现在的时间是：<span style="font-weight:900">{{always()}}{{Time.year}}年,{{Time.month}}月{{Time.day}}号,{{Time.Hours}} : {{Time.Minute}} : {{Time.Seconds}}  {{Time.week}}</span></h4>
            <div class="nav">
                <a  class="font-hei"   v-on:mouseenter="mouseover" v-on:mouseleave="mouseover" v-on:click="goto($event,index)" v-bind:class="{active:i == index}" ref="link" v-for="(item,index) in navlink">{{item.text}}</a>
            </div>
		</div>
	</div>
</div>
</transition>
  
</div>
</template>
<script>
  import router from '.././router'
  export default {
    data() {
      return {
        Time: {
          year: '',
          month: '',
          day: '',
          Hours: '',
          Minute: '',
          Seconds: '',
          during: '',
          week:''
        },
        navlink: [
          { text: '首页' },
          { text: 'javaScript' },
          { text: 'Node.js' },
          { text: 'Vue' },
          {text : '留言板'}
        ],
        i: 0,
        nav2Show: false
      }
    },
        computed: {
        abounce: function (event) {
          event.addClass = ''
        }
      },
      methods: {
        Timestr:
        function () {
          var d = new Date();
          this.Time.month = d.getMonth() + 1;
          this.Time.year = d.getFullYear();
          this.Time.day = d.getDate();
          this.Time.Hours = d.getHours();
          this.Time.Minute = d.getMinutes();
          this.Time.Seconds = d.getSeconds();
          
          if (this.Time.Hours >= 0 && this.Time.Hours <= 6) {
            this.Time.during = "深夜好";
          }
          else if (this.Time.Hours > 6 && this.Time.Hours <= 12) {
            this.Time.during = "中午好";
          }
          else if (this.Time.Hours > 12 && this.Time.Hours <= 18) {
            this.Time.during = "下午好";
          }
          else if (this.Time.Hours > 18 && this.Time.Hours <= 24) {
            this.Time.during = "晚上好";
          }
          var day = new Date().getDay();
          switch (day) {
            case 0:
              this.Time.week = "星期日";
              break;
            case 1:
              this.Time.week = "星期一";
              break;
            case 2:
              this.Time.week = "星期二";
              break;
            case 3:
              this.Time.week = "星期三";
              break;
            case 4:
              this.Time.week = "星期四";
              break;
            case 5:
              this.Time.week = "星期五";
              break;
            case 6:
              this.Time.week = "星期六";
              break;
          }

        },
        always: function () {
          setTimeout(this.Timestr, 1000);
        },
        mouseover: function (e) {
          var el = e.target;
          $(el).toggleClass("animated bounceIn backgroundA");
        },
        goto: function (e, index) {
          window.scrollTo(0, 0);
          var links = this.$refs.link;
          var link2 = this.$refs.link2;
          if (e.target == links[0] || e.target == link2[0]) {
            router.push("/home/page/1");
          }
          else if (e.target == links[4] ||  e.target == link2[4]) {
            router.push("/lyb");
          } else if (e.target == links[1] || e.target == link2[1]) {
            router.push("/javascript/page/1")
          } else if (e.target == links[2] || e.target == link2[2]) {
            router.push("/Node/page/1");
          } else if (e.target == links[3] || e.target == link2[3]) {
            router.push("/Vue/page/1");
          }
          this.i = index;
        },
        shiftNav() {
          self = this;
          $(window).scroll(function () {
            var height = $(document).scrollTop();
            if (height > "100") {
              self.nav2Show = true;
            } else {
              self.nav2Show = false;
            }
          });
          
        }
      }
    }
</script>
<style>
  .header {
    padding-left: 0px;
    padding-right: 0px;
    background-color:white;
    background-color:rgba(255, 255, 255,0.4);
    text-align:center;
}

div.nav{
    margin:0 auto;
}
div.nav a{
    display:inline-block; 
    font-size:1.5em;
    font-weight:500;
    margin: 0  50px;
    cursor:pointer;
    text-decoration:none;
    padding:20px;
    color:darkslateblue;
}

div.nav a:hover{
    color:white;
}
.active{
  color:white !important;
  background-color:darkslateblue;
  border-radius:5px;
}
.backgroundA{
    background-color:darkslateblue;
    border-radius:5px;
}
div.secondNav{
  width:100%;
  position:fixed;
  background-color:white;
  z-index:2;
}
div.nav2{
  padding:10px;
}
div.nav2 a{
  text-align:center;
  font-size:1.5em;
  padding:15px;
  color:darkslateblue;
  cursor:pointer;
  margin-left:20px;
  border-radius:10px;
}
div.nav2 a:hover{
  text-decoration:none;
  color:white;
  background-color:darkslateblue;
}
.slide-fade-enter-active {
  transition: all .3s ease;
}
.slide-fade-leave-active {
  transition: all .8s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active for below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>
