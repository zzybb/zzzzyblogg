<template>
<div>
 <transition 
             name="custom-classes-transition"
             enter-active-class="animated bounceInRight"
             leave-active-class="animated bounceOutRight" mode="out-in">
  <router-view name="contentBig" v-bind:router-data="sourceData" v-bind:key="change"></router-view>
</transition>
    <div class="divide" style="text-align:center">
         <ul class="pagination">
             <li><a href="#">&laquo;</a></li>
            <template v-for="(num,index) in sourceData.pages">
             <li  v-on:click="puke(index)" v-bind:class="{active:i==index}"><a style="cursor:pointer" >{{num}}</a></li>
            </template>
             <li><a href="#">&raquo;</a></li>
         </ul>
    </div>
</div>
</template>
<script>
  import router from '.././router'
  export default {
    props: ["sourceData"],
    data() {
      return {
        change: true,
        i: null,
      }
    },
    created() {
      this.i = 0;
      
    },
    methods: {
      puke(index) {
        var curNum = index + 1;
        this.change = !this.change;
        router.push(this.$route.path.slice(0, 11) + curNum);
        this.i = index;
      },
    }
  }
</script>
<style>
ul.pagination a{
  margin-right:10px;
  background-color:rgba(255, 255, 255,0.6);
  border:none;
}

</style>
