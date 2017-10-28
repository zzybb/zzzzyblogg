<template>
<div>
  <div class="media animated" v-for="(item,index) in routerData.showData" v-on:mouseenter="mouseover"
                       v-on:click="go(item,index)">
      <div class="media-left">
           <img class="media-object">
      </div>
      <div class="media-body" style="padding:0 20px 20px 20px;">
           <h3 class="media-heading" v-text="item.title" style=" color:darkslateblue;font-weight:500"></h3>
           <i class="fa fa-heart-o">点赞:{{item.goods}}次</i>
           <i class="fa fa-stack-exchange">评论:{{item.comments}}次</i>
           <i class="fa fa-stack-overflow">分类:{{item.Tag}}</i>
           <br />
            <span style='font-size:15px;color:floralwhite;'>{{item.content | more}}</span>
      </div>
</div>
</div>
</template>
<script>
  import router from '.././router'
  export default {
    props: ["routerData"],
    data() {
      return {
      }
    },
    methods: {
      mouseover(e) {
        var el = e.target;
        $(el).toggleClass("shake");
      },
      go(obj, index) {
        window.scrollTo(0, 0);
        this.$store.commit('Loading');
        console.log(this.$store.state.loadingShow);
        if (this.$route.path.indexOf("/home/page/") !== -1) {
          var pageNum = this.$route.path.slice(11, 12);
          router.push("/content/" + pageNum + '/' + index);
        } else {
          var id = this.routerData.showData[index].id.toString();
          console.log(id);
          router.push("/content/" + id[0] + '/' + id[1]);
        }
      },
    },
      filters: {
        more(value) {
          var newMessage = value.slice(0, 200) + "........";
          return newMessage;
        }
      }
    
  }
</script>
<style>
div.media{
  background-color:rgba(255, 255, 255,0.4);
  border-radius:10px;
  padding:20px 20px ;
  cursor:pointer;
}

.media-body i{
  margin:0 100px 40px 0;
}


</style>
