<template>
<div>
  <div class="loading" v-show="this.$store.state.loadingShow">
    <div class="spinner"></div>
    <h1 style="color:white;">loading...</h1>
  </div>
    <div  style="overflow:hidden;"   v-show="mainShow">
      <h1 class="About" v-on:click="enter">进入博客</h1>
      <h1 class="hello">Hello</h1>
    </div>
  <router-view name="nav"></router-view>
  <transition :duration="{enter:1000,leave: 100 }"
    name="custom2-classes-transition"
    enter-active-class="animated zoomIn"
    leave-active-class="animated zoomOut" mode="out-in">
  <router-view name="Aboutme"></router-view>
    </transition>
    <transition :duration="{enter:1000,leave: 100 }"
    name="custom2-classes-transition"
    enter-active-class="animated zoomIn"
    leave-active-class="animated zoomOut" mode="out-in">
  <router-view name="lyb"></router-view>
      </transition>
    <div>
    <transition :duration="{enter:1000,leave: 100 }"
    name="custom2-classes-transition"
    enter-active-class="animated bounceIn"
    leave-active-class="animated zoomOut" mode="out-in">
  <router-view name="detailContent"></router-view>
      </transition>
    </div>
  
  <div class="container-fluid content">
	     <div class="row-fluid">
		        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
              <transition 
                         name="custom-classes-transition"
                         enter-active-class="animated bounceInLeft"
                         leave-active-class="animated bounceOutLeft" mode="out-in">
                 <router-view name="profile"></router-view>
              </transition>
            </div>
            <div class="col-lg-9  col-md-9 col-sm-9 col-xs-9">
              <transition
                           name="content"
                           enter-active-class="animated bounceInRight"
                           leave-active-class="animated bounceOutRight" mode="out-in">
                  <router-view name="content" v-bind:source-data="allData"></router-view>
                </transition>
            </div>

      </div>
    </div>

 </div>
</template>
<script>
  import router from './router'
  export default {
    data() {
      return {
        mainShow: true,
        allData: {
          fullData: null,
          showData: null,
          pages: null,
          change: false,
          
        }
      }
    },
    beforCreate() {
      this.$store.commit('Loading');
    },
    created() {
      this.routePath();
    },
    watch: {
      "$route"(to) {
        this.routePath();
      }
    },
    mounted() {
        //this.$store.commit('Loading');
    },
    methods: {
      routePath() {
        if (this.$route.path !== "/") {
          this.mainShow = false;
        } else {
          this.mainShow = true;
        };
        if (this.$route.fullPath == "/home/page/1") {
          this.$store.commit('Loading');
          this.loadHome();
        } else if (this.$route.fullPath == "/javascript/page/1") {
          this.$store.commit('Loading');
          this.loadJava();
        } else if (this.$route.fullPath == "/Node/page/1") {
          this.$store.commit('Loading');
          this.loadNode();
        } else if (this.$route.fullPath == "/Vue/page/1") {
          this.$store.commit('Loading');
          this.loadVue();
        }

      },
      loadHome() {
        var listData = this.$route.path.slice(11, 12);
        var numData = listData - 1;
        this.allData.change = !this.allData.change;
        this.$nextTick(e => {
          this.$http.get("/essay").then(rea => {
            this.allData.fullData = rea.body;
            console.log(rea.body);
            var pageNum = rea.body.length / 6
            if (pageNum <= 1) {
              this.allData.pages = 1;
            } else {
              this.allData.pages = pageNum;
            }
            this.allData.showData = rea.body.slice(numData * 6, numData * 6 + 6);
            this.$store.commit('Loading');
          })
        })
      },
      loadJava() {
        var listData = this.$route.path.slice(17, 18);
        var numData = listData - 1;
        this.$nextTick(e => {
          this.$http.get("/essay/Javascript").then(rea => {
            this.allData.fullData = rea.body;
            console.log(rea.body);
            var pageNum = rea.body.length / 6
            if (pageNum <= 1) {
              this.allData.pages = 1;
            } else {
              this.allData.pages = pageNum;
            }
            this.allData.showData = rea.body.slice(numData * 6, numData * 6 + 6);
            this.$store.commit('Loading');
          })
        })
      },
      loadNode() {
        var listData = this.$route.path.slice(11, 12);
        var numData = listData - 1;
        this.$nextTick(e => {
          this.$http.get("/essay/Node").then(rea => {
            this.allData.fullData = rea.body;
            console.log(rea.body);
            var pageNum = rea.body.length / 6
            if (pageNum <= 1) {
              this.allData.pages = 1;
            } else {
              this.allData.pages = pageNum;
            }
            this.allData.showData = rea.body.slice(numData * 6, numData * 6 + 6);
            this.$store.commit('Loading');
          })
        })
      },
      loadVue() {
        var listData = this.$route.path.slice(10,11);
        var numData = listData - 1;
        this.$nextTick(e => {
          this.$http.get("/essay/Vue").then(rea => {
            this.allData.fullData = rea.body;
            console.log(rea.body);
            var pageNum = rea.body.length / 6
            if (pageNum <= 1) {
              this.allData.pages = 1;
            } else {
              this.allData.pages = pageNum;
            }
            this.allData.showData = rea.body.slice(numData * 6, numData * 6 + 6);
            this.$store.commit('Loading');
          })
        })
      },

      enter() {
        router.push("/home/page/1");
      },
    }
  }
  
 
</script>
<style>
body{
    width:100%;
    height:100%;
    background-image:url(http://oy2mxvmv9.bkt.clouddn.com/background.jpg);
    background-attachment:fixed;
    background-repeat:no-repeat;
    font-size:16px;
    overflow-x:hidden;
     font-family: -apple-system, BlinkMacSystemFont,
    "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell",
    "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif;
}
div.content{
    padding-left:5em;
    padding-right:5em;
    margin-top:30px;
}
h1.enterBlog{
  display:block;
  position:absolute;
  top:75%;
  left:3%;
  color:white;
}
h1.hello{
  transform:translateX(-50%);
  left:45%;
  top:50%;
  transform:translateY(-50%);
  color:white;
  font-size:5em;
  position:absolute;
}
h1.About{
  color:white;
  display:block;
  position:absolute;
  left:85%;
  top:85%;
  cursor:pointer;
}
.loading{
  overflow:hidden;
  position:fixed;
  width:100%;
  height:100%;
  background-color:rgba(0, 0, 0,0.8);
  z-index:20;
  text-align:center;
}
.loading h1{
  position:relative;
    top:55%;
}
.spinner {
  position:relative;
  width: 60px;
  height: 60px;
  background-color: darkslateblue;
  top:50%;
  //left:50%;
  margin:0 auto;
  -webkit-animation: rotateplane 1.2s infinite ease-in-out;
  animation: rotateplane 1.2s infinite ease-in-out;
}
 
@-webkit-keyframes rotateplane {
  0% { -webkit-transform: perspective(120px) }
  50% { -webkit-transform: perspective(120px) rotateY(180deg) }
  100% { -webkit-transform: perspective(120px) rotateY(180deg)  rotateX(180deg) }
}
 
@keyframes rotateplane {
  0% {
    transform: perspective(120px) rotateX(0deg) rotateY(0deg);
    -webkit-transform: perspective(120px) rotateX(0deg) rotateY(0deg)
  } 50% {
    transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg);
    -webkit-transform: perspective(120px) rotateX(-180.1deg) rotateY(0deg)
  } 100% {
    transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
    -webkit-transform: perspective(120px) rotateX(-180deg) rotateY(-179.9deg);
  }
}
</style>
