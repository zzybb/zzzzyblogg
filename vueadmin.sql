# Host: localhost  (Version: 5.5.53)
# Date: 2017-10-28 10:19:07
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "comment"
#

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `art_id` int(20) NOT NULL,
  `comments` text NOT NULL,
  `creat_time` timestamp NULL DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `usermail` varchar(100) NOT NULL,
  `lyb` varchar(255) DEFAULT NULL,
  `parent_Id` varchar(11) DEFAULT NULL,
  `commentsId` int(11) DEFAULT NULL,
  `Tousername` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "comment"
#

/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

#
# Structure for table "essay"
#

DROP TABLE IF EXISTS `essay`;
CREATE TABLE `essay` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `title` varchar(50) NOT NULL,
  `Tag` varchar(20) NOT NULL,
  `creatTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `goods` int(11) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id_2` (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "essay"
#

/*!40000 ALTER TABLE `essay` DISABLE KEYS */;
INSERT INTO `essay` VALUES (10,'This is an H1\r\n=============\r\n**转载自`http://www.cnblogs.com/lvdabao/`**\r\nES6 Promise 先拉出来遛遛\r\n复杂的概念先不讲，我们先简单粗暴地把Promise用一下，有个直观感受。那么第一个问题来了，Promise是什么玩意呢？是一个类？对象？数组？函数？\r\n\r\n\r\n别猜了，直接打印出来看看吧，console.dir(Promise)，就这么简单粗暴。\r\n![此处输入图片的描述][1]\r\n\r\n\r\n  [1]: http://oy2mxvmv9.bkt.clouddn.com/520134-20160311003722741-755677508.png\r\n  这么一看就明白了，Promise是一个构造函数，自己身上有all、reject、resolve这几个眼熟的方法，原型上有then、catch等同样很眼熟的方法。这么说用Promise new出来的对象肯定就有then、catch方法喽，没错。\r\n \r\n那就new一个玩玩吧。\r\n\r\n    var p = new Promise(function(resolve, reject){\r\n    //做一些异步操作\r\n    setTimeout(function(){\r\n        console.log(\'执行完成\');\r\n        resolve(\'随便什么数据\');\r\n    }, 2000);});\r\n\r\nPromise的构造函数接收一个参数，是函数，并且传入两个参数：resolve，reject，分别表示异步操作执行成功后的回调函数和异步操作执行失败后的回调函数。其实这里用“成功”和“失败”来描述并不准确，按照标准来讲，resolve是将Promise的状态置为fullfiled，reject是将Promise的状态置为rejected。不过在我们开始阶段可以先这么理解，后面再细究概念。\r\n \r\n在上面的代码中，我们执行了一个异步操作，也就是setTimeout，2秒后，输出“执行完成”，并且调用resolve方法。\r\n \r\n运行代码，会在2秒后输出“执行完成”。注意！我只是new了一个对象，并没有调用它，我们传进去的函数就已经执行了，这是需要注意的一个细节。所以我们用Promise的时候一般是包在一个函数中，在需要的时候去运行这个函数，如：','关于ES6中的Promise','JavaScript','2017-10-27 16:22:26',0,1),(11,'**vue.js使用vue-cli搭建一个SPA项目**\r\n================================\r\n之所以写这篇如何运用脚手架自动化构建出一个项目的大架构，主要是面向想入门vue的小伙伴。之前，我第一次接触vue，一直摸不着头脑，想在网上搜个接地气的教程都找不到。SO，我以如何搭建结构为开始，向想入门vue的童鞋们把我仅有的力量贡献出来，随后我会持续更新vue如何与ui框架结合使用；在低版本ie如何运用vwjs将其打包为桌面应用以及我在实际开发的过程中踩过的各种坑。欢迎大家观看与互相交流哦。\r\n\r\n\r\n----------\r\n1.首先，你的电脑需要nodejs环境，如果没有，点击下面链接去下载吧。\r\n----\r\n\r\n> 点我进入node官网\r\nhttps://nodejs.org/en/\r\n安装完毕之后在命令窗口执行 node -v\r\n\r\n\r\n----------\r\n2.安装脚手架vue-cli\r\n-\r\n\r\n> 在命令窗口执行 npm install -g vue-cli\r\n\r\n安装完毕之后在命令窗口执行 vue -V -----大写V哦\r\n如果执行完毕后会出现cli的版本号就ok了\r\n\r\n\r\n----------\r\n\r\n\r\n3.在你的项目目录下初始化一个webpack配置的项目\r\n----\r\n\r\n> 在命令窗口执行 vue init webpack name -------name是你的项目名称 执行命令后会有 ?Project name\r\n> <name> --------输入项目名称，回车\r\n> \r\n> `Project description` -----------输入你的项目描述，回车 Author\r\n> -----------顾名思义，输入作者名，回车\r\nVue build ----------- 必须回车啊\r\nInstall vue-router?<y/n> ----------是否需要vue-router,做项目有路由啊，输入y，回车\r\nUse ESLint to lint your code ?<y/n> --------是否需要ESlint检验你的代码格式，个人建议，如果不太了解ESlint，或者你的开发团队不需要这个东东，最好n，否则他的检验标准会让你很无语，当然，你可以通过配置去除你不需要的代码格式校验，随你喽，要就y，不要就n，回车\r\nSetup unit tests with Karma + Mocha? (y/n) ----------是否安装单元测试，看你的需求喽，一般情况没有就n，回车\r\nSetup e2e tests with Nightwatch(y/n)? -----------是否安装e2e测试，同上，回车\r\n\r\n4.在你新建好的项目目录下install安装所有需要的模板\r\n--\r\n\r\n> 在命令窗口执行npm install-------它会根据package.json文件里依赖的所有模块进行安装，回车之后你就静静的wait,其实据说用yarn会快一点，我在工作中leader要求用yarn，不过俩者用法差不多，有兴趣的话可以去看看哦\r\n\r\n5.运行你的项目\r\n--\r\n\r\n> 在命令窗口执行npm run dev ----现在你的项目就运行起来了\r\n','vuecli的搭建流程','Vue','2017-10-27 16:20:25',0,0),(12,'**webpack+vue-cil 配置接口地址代理以及将项目打包到子目录的方法**\r\n=\r\n将接口配置到本地代理的方法\r\n-\r\n\r\n\r\n----------\r\n一般来说，我们会在正式环境中讲接口配置到和项目路径是一个域名下的。因此，我们没必要在调用接口的时候使用绝对地址，使用相对地址即可。但是开发环境的话，我们本地跑的是localhost:8080地址，当然要使用包含域名的接口地址了。\r\n\r\n文字描述有点晕，举个栗子\r\n**正式环境**\r\n\r\n接口地址 | 前端页面地址\r\n-------|----------\r\n/api/**\t |    /\r\n\r\n接口地址|\t前端页面地址\r\n-|-\r\nhttp://www.xxx.com/api/**|\thttp://localhost:8080\r\n\r\n如上，在请求上，我们的开发环境不仅仅面临要把接口的全路径写全的问题，还包括跨域问题等等。\r\n\r\n所以，解决这个问题的方法就出来了，将接口地址通过代理的方式映射到本地，让我们的本地开发也可以使用相对根目录的方式请求接口。\r\n\r\nwebpack本身自带了代理功能，我们的vue-cil更是集成了进来，只要经过简单的配置即可。\r\n\r\n我们打开下面路径的文件\r\n>config/index.js\r\n\r\n在其中的dev对象里面找到：\r\n>proxyTable: {},\r\n\r\n这里就是配置代理的地方，我们进行如下设置：\r\n\r\n>proxyTable: {\r\n  \'/api/**\': {\r\n    target: \'http://www.xxx.com\', // 你接口的域名\r\n    secure: false,      // 如果是https接口，需要配置这个参数\r\n    changeOrigin: true,     // 如果接口跨域，需要进行这个参数配置\r\n  }\r\n},\r\n\r\n将项目打包到子目录\r\n\r\n默认配置下，我们的项目只能在根目录下运行，如果真这样的话，那还是非常麻烦的，可能我们需要在一个域名下面跑多个项目。\r\n\r\n通过下面的简单设置，可以将我们打包的文件放在任意地方跑起来。\r\n\r\n同样是config/index.js这个配置文件，我们找到build节点，找到下面的代码：\r\n\r\n>assetsPublicPath: \'/\',\r\n\r\n上面的代码是表示，我们打包出来的路径是相对根目录的。这里，你可能想到了，那就在这里写具体的子目录路径就好了。也不是不行，不过我们一般这么配置\r\n\r\n>assetsPublicPath: \'./\',\r\n\r\n加一个英文句号即可。这表示在当前目录下。这样，你随便放在哪里都可以跑起来了。\r\n\r\n上面的说法是错误的。经过测试，在有资源的情况下，这样处理会出问题，正确的做法是，你放在什么目录就应该在这里填写什么目录，才能够正确的编译css中的图片地址。 \r\n例如，你想放在/h5/下面，就应该这样填写`assetsPublicPath: \'/h5/\'`, \r\n另外，在windows下面实测编译会出错，会提示没有权限创建文件夹。但是在mac和linux上没有问题。 \r\n这我就不得而知了。\r\n','Vue+Webpack配置代理（跨域）','Vue','2017-10-27 16:20:27',0,0),(13,'Nodejs 进阶：Express 常用中间件 body-parser 实现解析\r\n=\r\n`body-parser`是非常常用的一个`express`中间件，作用是对post请求的请求体进行解析。使用非常简单，以下两行代码已经覆盖了大部分的使用场景。\r\n\r\n        app.use(bodyParser.json());\r\n    \r\n    app.use(bodyParser.urlencoded({ extended: false }));\r\n\r\n本文从简单的例子出发，探究body-parser的内部实现。至于body-parser如何使用，感兴趣的同学可以参考官方文档。\r\n\r\n--------------\r\n在正式讲解前，我们先来看一个POST请求的报文，如下所示。\r\n\r\n    POST /test HTTP/1.1\r\n    Host: 127.0.0.1:3000\r\n    Content-Type: text/plain; charset=utf8\r\n    Content-Encoding: gzip\r\n    \r\n    chyingp\r\n    \r\n    其中需要我们注意的有`Content-Type、Content-Encoding`以及报文主体：\r\n\r\nContent-Type：请求报文主体的类型、编码。常见的类型有text/plain、application/json、application/x-www-form-urlencoded。常见的编码有utf8、gbk等。\r\nContent-Encoding：声明报文主体的压缩格式，常见的取值有gzip、deflate、identity。\r\n报文主体：这里是个普通的文本字符串chyingp。\r\n\r\nbody-parser主要做了什么\r\n-\r\nbody-parser实现的要点如下：\r\n\r\n处理不同类型的请求体：比如text、json、urlencoded等，对应的报文主体的格式不同。\r\n处理不同的编码：比如utf8、gbk等。\r\n处理不同的压缩类型：比如gzip、deflare等。\r\n其他边界、异常的处理。\r\n一、处理不同类型请求\r\n\r\n一、处理不同类型请求体\r\n-\r\n解析text/plain\r\n\r\n客户端请求的代码如下，采用默认编码，不对请求体进行压缩。请求体类型为text/plain。\r\n\r\n    var http = require(\'http\');\r\n    \r\n    var options = {\r\n        hostname: \'127.0.0.1\',\r\n        port: \'3000\',\r\n        path: \'/test\',\r\n        method: \'POST\',\r\n        headers: {\r\n            \'Content-Type\': \'text/plain\',\r\n            \'Content-Encoding\': \'identity\'\r\n        }\r\n    };\r\n    \r\n    var client = http.request(options, (res) => {\r\n        res.pipe(process.stdout);\r\n    });\r\n    \r\n    client.end(\'chyingp\');\r\n\r\n服务端代码如下。text/plain类型处理比较简单，就是buffer的拼接。\r\n\r\n    var http = require(\'http\');\r\n    \r\n    var parsePostBody = function (req, done) {\r\n        var arr = [];\r\n        var chunks;\r\n    \r\n        req.on(\'data\', buff => {\r\n            arr.push(buff);\r\n        });\r\n    \r\n        req.on(\'end\', () => {\r\n            chunks = Buffer.concat(arr);\r\n            done(chunks);\r\n        });\r\n    };\r\n    \r\n    var server = http.createServer(function (req, res) {\r\n        parsePostBody(req, (chunks) => {\r\n            var body = chunks.toString();\r\n            res.end(`Your nick is ${body}`)\r\n        });\r\n    });\r\n    \r\n    server.listen(3000);\r\n\r\n解析application/json\r\n\r\n客户端代码如下，把Content-Type换成application/json。\r\n\r\n    var http = require(\'http\');\r\n    var querystring = require(\'querystring\');\r\n    \r\n    var options = {\r\n        hostname: \'127.0.0.1\',\r\n        port: \'3000\',\r\n        path: \'/test\',\r\n        method: \'POST\',\r\n        headers: {\r\n            \'Content-Type\': \'application/json\',\r\n            \'Content-Encoding\': \'identity\'\r\n        }\r\n    };\r\n    \r\n    var jsonBody = {\r\n        nick: \'chyingp\'\r\n    };\r\n    \r\n    var client = http.request(options, (res) => {\r\n        res.pipe(process.stdout);\r\n    });\r\n\r\nclient.end( JSON.stringify(jsonBody) );\r\n服务端代码如下，相比text/plain，只是多了个JSON.parse()的过程。\r\n\r\n    var http = require(\'http\');\r\n    \r\n    var parsePostBody = function (req, done) {\r\n        var length = req.headers[\'content-length\'] - 0;\r\n        var arr = [];\r\n        var chunks;\r\n    \r\n        req.on(\'data\', buff => {\r\n            arr.push(buff);\r\n        });\r\n    \r\n        req.on(\'end\', () => {\r\n            chunks = Buffer.concat(arr);\r\n            done(chunks);\r\n        });\r\n    };\r\n    \r\n    var server = http.createServer(function (req, res) {\r\n        parsePostBody(req, (chunks) => {\r\n            var json = JSON.parse( chunks.toString() );    // 关键代码    \r\n            res.end(`Your nick is ${json.nick}`)\r\n        });\r\n    });\r\n    \r\n    server.listen(3000);\r\n\r\n解析application/x-www-form-urlencoded\r\n\r\n客户端代码如下，这里通过querystring对请求体进行格式化，得到类似nick=chyingp的字符串。\r\n\r\n    var http = require(\'http\');\r\n    var querystring = require(\'querystring\');\r\n    \r\n    var options = {\r\n        hostname: \'127.0.0.1\',\r\n        port: \'3000\',\r\n        path: \'/test\',\r\n        method: \'POST\',\r\n        headers: {\r\n            \'Content-Type\': \'form/x-www-form-urlencoded\',\r\n            \'Content-Encoding\': \'identity\'\r\n        }\r\n    };\r\n    \r\n    var postBody = { nick: \'chyingp\' };\r\n    \r\n    var client = http.request(options, (res) => {\r\n        res.pipe(process.stdout);\r\n    });\r\n    \r\n    client.end( querystring.stringify(postBody) );\r\n\r\n服务端代码如下，同样跟text/plain的解析差不多，就多了个querystring.parse()的调用。\r\n\r\n    var http = require(\'http\');\r\n    var querystring = require(\'querystring\');\r\n    \r\n    var parsePostBody = function (req, done) {\r\n        var length = req.headers[\'content-length\'] - 0;\r\n        var arr = [];\r\n        var chunks;\r\n    \r\n        req.on(\'data\', buff => {\r\n            arr.push(buff);\r\n        });\r\n    \r\n        req.on(\'end\', () => {\r\n            chunks = Buffer.concat(arr);\r\n            done(chunks);\r\n        });\r\n    };\r\n    \r\n    var server = http.createServer(function (req, res) {\r\n        parsePostBody(req, (chunks) => {\r\n            var body = querystring.parse( chunks.toString() );  //\r\n','Nodejs 进阶：Express 常用中间件 body-parser 实现解析','Node','2017-10-27 16:20:30',0,0),(14,'用Vue+Node.js搭建个人博客（一）---前端界面实现\r\n=\r\n前言\r\n-\r\n前端入门后就一直想写一个个人博客，而hexo,wordpress等觉得做出来并不是特别满意（虽然我自己也不懂设计），在看了[迷津渡口][1]和[杨青][2]的博客后，慢慢也有自己的想法，在此感谢迷津渡口网页站长，你的网站给我很多外观上的思路（好像基本外观特别像），所以这篇算是对这次建站的一个总结。\r\n\r\n要想实现切换网页时的动态效果（如切入过渡切出过渡）就必须要无刷新效果，而ajax虽然可以局部刷新，URL值却没办法改变。在尝试过PJAX后，我发现还是很多用不顺手的地方，所以决定学习vue.并用路由插件来实现单页应用。\r\n\r\n了解Vue\r\n-\r\nVue.js (读音 /vjuː/，类似于 view) 是一套构建用户界面的渐进式框架。与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。Vue 的核心库只关注视图层，它不仅易于上手，还便于与第三方库或既有项目整合。另一方面，当与单文件组件和 Vue 生态系统支持的库结合使用时，Vue 也完全能够为复杂的单页应用程序提供驱动。(来自Vue官网)\r\n\r\n友好的中文文档实在让我泪流满面，之前看很多都是英文的。尽管网上很多人很简单，但是对于我这个第一次接触框架的前端菜鸟来说还是有点吃力的。在稀里糊涂看完一遍文档并且打了所有示例代码后就开始入手博客制作了。\r\n\r\nVue-cli\r\n-\r\n官方说不建议新手使用Vue-cli，但是网上很多教程都使用了这个，也只能硬着头皮搞起来。之前**转载**过具体的搭建，现在对每一个部分说明。\r\n![此处输入图片的描述][3]\r\n\r\n前端目前只用src,static两个文件夹\r\nsrc用于存储组件（components下的.vue文件），路由（router下的index.js）,入口js文件\r\n（main.js）文件，入口vue文件(App.vue)。\r\nstatic文件用于存储静态文件（图片等）。\r\nindex.html是整个应用的入口文件。\r\n\r\n这里解释一下xxx.vue文件是什么，官网叫其为单文件组件，通过webpack源码转换，会全部转换为对应的文件。\r\n说白了就是一个包裹，里边含有三部分 一部分模板template，一部分样式style，一部分JSjavascript，他们封装在一起。\r\n\r\n他们是如何运作的？\r\n-\r\n这里借用别人的一张图（转载自https://segmentfault.com/a/1190000009160934?_ea=1849098）\r\n![此处输入图片的描述][4]\r\n\r\nmain.js中挂载了Vue实例\r\n![此处输入图片的描述][5]\r\n\r\nimport ..from...是es6的引入模块写法，Vue 开始渲染时，加载 components: { App } 组件替换生成在 id=\"index\" 内的 <App></App> 标签，zzyapp是我把主Vue文件的名字改了，原名是App.vue。\r\nVue.config.productionTip =false 则表示关闭了生产模式即部署到服务器后给出的提示。\r\n\r\nzzyapp.vue\r\n-\r\n这是主渲染界面，你所有的组件都可以放在这里，在渲染的时候用vue-router来选择你不同路由渲染不同的东西。\r\n\r\n   \r\n\r\n     <template>\r\n    <div>     \r\n        <div v-show=\"mainShow\" style=\"text-align:center;\">\r\n          <h1 class=\"About\" v-on:click=\"enter\">进入博客</h1>\r\n          <h1 class=\"hello\">Hello</h1>\r\n        </div>\r\n      <router-view name=\"nav\"></router-view>\r\n      <transition :duration=\"{enter:1000,leave: 100 }\"\r\n        name=\"custom2-classes-transition\"\r\n        enter-active-class=\"animated zoomIn\"\r\n        leave-active-class=\"animated zoomOut\" mode=\"out-in\">\r\n      <router-view name=\"Aboutme\"></router-view>\r\n        </transition>\r\n        <transition :duration=\"{enter:1000,leave: 100 }\"\r\n        name=\"custom2-classes-transition\"\r\n        enter-active-class=\"animated zoomIn\"\r\n        leave-active-class=\"animated zoomOut\" mode=\"out-in\">\r\n      <router-view name=\"lyb\"></router-view>\r\n          </transition>\r\n        <div>\r\n        <transition :duration=\"{enter:1000,leave: 100 }\"\r\n        name=\"custom2-classes-transition\"\r\n        enter-active-class=\"animated bounceIn\"\r\n        leave-active-class=\"animated zoomOut\" mode=\"out-in\">\r\n      <router-view name=\"detailContent\" v-bind:source-dedata=\"allData.detailedData\" :key=\"change\"></router-view>\r\n          </transition>\r\n        </div>\r\n      \r\n      <div class=\"container-fluid content\">\r\n    \t     <div class=\"row-fluid\">\r\n    \t\t        <div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3\">\r\n                  <transition \r\n                             name=\"custom-classes-transition\"\r\n                             enter-active-class=\"animated bounceInLeft\"\r\n                             leave-active-class=\"animated bounceOutLeft\" mode=\"out-in\">\r\n                     <router-view name=\"profile\"></router-view>\r\n                  </transition>\r\n                </div>\r\n                <div class=\"col-lg-9  col-md-9 col-sm-9 col-xs-9\">\r\n                  <transition\r\n                               name=\"content\"\r\n                               enter-active-class=\"animated bounceInRight\"\r\n                               leave-active-class=\"animated bounceOutRight\" mode=\"out-in\">\r\n                      <router-view name=\"content\" v-bind:source-data=\"allData\"></router-view>\r\n                    </transition>\r\n                </div>\r\n    \r\n          </div>\r\n        </div>\r\n     </div>\r\n    </template>\r\n    <script>\r\n      import router from \'./router\'\r\n      export default {\r\n        data() {\r\n          return {\r\n            mainShow: true,\r\n            allData: {\r\n              fullData: null,\r\n              showData: null,\r\n              pages: null,\r\n              change: false,\r\n              \r\n            }\r\n          }\r\n        },\r\n        created() {\r\n          this.routePath();\r\n        },\r\n        watch: {\r\n          \"$route\"(to) {\r\n            this.routePath();\r\n          }\r\n        },\r\n    \r\n        methods: {\r\n          routePath() {\r\n            if (this.$route.fullPath == \"/home\") {\r\n              router.push(\"/home/page/1\");\r\n              this.load();\r\n            } else {\r\n              this.load();\r\n            }\r\n    \r\n          },\r\n          load() {\r\n            var url = \'/content/\' + this.$route.path.slice(9, 10) + \'/\' + this.$route.path.slice(11, 12);\r\n            var essay = url + \'/\' + \"essay\";\r\n            if (this.$route.path !== \"/\") {\r\n              this.mainShow = false;\r\n            } else {\r\n              this.mainShow = true;\r\n            }\r\n            var listData = this.$route.path.slice(11, 12);\r\n            var numData = listData - 1;\r\n            this.change = !this.change;\r\n    \r\n            this.$nextTick(e => {\r\n              this.$http.get(\"/essay\").then(rea => {\r\n                this.allData.fullData = rea.body;\r\n                console.log(rea.body);\r\n                var pageNum = rea.body.length / 6\r\n                if (pageNum <= 1) {\r\n                  this.allData.pages = 1;\r\n                } else {\r\n                  this.allData.pages = pageNum;\r\n                }\r\n                this.allData.showData = rea.body.slice(numData * 6, numData * 6 + 6);\r\n              })\r\n            })\r\n          },\r\n          \r\n          enter() {\r\n            router.push(\"/home\");\r\n          }\r\n        }\r\n      }\r\n      \r\n     \r\n    </script>\r\n    <style>\r\n    body{\r\n        width:100%;\r\n        height:100%;\r\n        background-image:url(../static/images/background.jpg);\r\n        background-attachment:fixed;\r\n        background-repeat:no-repeat;\r\n        font-size:16px;\r\n        overflow-x:hidden;\r\n    }\r\n    div.content{\r\n        padding-left:5em;\r\n        padding-right:5em;\r\n        margin-top:30px;\r\n    }\r\n    h1.enterBlog{\r\n      display:block;\r\n      position:absolute;\r\n      top:75%;\r\n      left:3%;\r\n      color:white;\r\n    }\r\n    h1.hello{\r\n      margin-top:20%;\r\n      display:block;\r\n      color:white;\r\n      font-size:5em;\r\n    }\r\n    h1.myname{\r\n      display:block;\r\n      //position:absolute;\r\n      //left:42%;\r\n      top:45%;\r\n      color:white;\r\n    }\r\n    h1.About{\r\n      color:white;\r\n      display:block;\r\n      position:absolute;\r\n      left:85%;\r\n      top:85%;\r\n      cursor:pointer;\r\n    }\r\n    </style>\r\n\r\n单文件组件就是\r\n\r\n> `<template>,<script>,<style>`\r\n\r\n组成，需要特别注意的是template中只能有一个根元素，意思就是不能出现这种情况：\r\n\r\n    <template>\r\n       <div></div>   //一个根元素\r\n       <div></div>   //第二个根元素\r\n    </template>\r\n    \r\n而应该使用\r\n\r\n    <template>\r\n    <div>  //把他们包裹起来只有一个根元素\r\n       <div></div>   \r\n       <div></div>\r\n    </div>\r\n    </template>\r\n    \r\n不然运行会抛错误\r\n\r\n    <router-view name=\"nav\"></router-view>\r\n    \r\n这种标签就是vue-router路由渲染出口，你所有在路由中指定的组件都会在这个出口处渲染出来。\r\n\r\n     <transition \r\n                             name=\"custom-classes-transition\"\r\n                             enter-active-class=\"animated bounceInLeft\"\r\n                             leave-active-class=\"animated bounceOutLeft\" mode=\"out-in\">\r\n                            \r\n这里我用了transition和Animate.css实现切换页面时的过渡效果，Animate.css可以在入口index.html中引用，jquery也可以在那里应用，所有组件都可以直接使用。\r\n\r\n    data() {\r\n          return {\r\n            mainShow: true,\r\n            allData: {\r\n              fullData: null,\r\n              showData: null,\r\n              pages: null,\r\n              change: false,\r\n    \r\n            }\r\n          }\r\n        },\r\n        \r\n这里的data需要注意，在组件中使用时，需要data是一个函数，这是为了防止多个组件用同一个data对象。\r\n\r\n    created() {\r\n          this.routePath();\r\n        },\r\n    \r\ncreated是Vue生命周期钩子函数，这里有另一篇详解Vue生命周期的文章。created主要用在DOM未加载前进行后端交互拿数据，到mouted状态一起渲染进网页里。\r\n\r\n     watch: {\r\n      \"$route\"(to) {\r\n        this.routePath();\r\n      }\r\n    },\r\n    \r\nwatch侦听器，用官方话说就是\r\n\r\n> 虽然计算属性在大多数情况下更合适，但有时也需要一个自定义的侦听器。这就是为什么 Vue 通过 watch\r\n> 选项提供了一个更通用的方法，来响应数据的变化。当需要在数据变化时执行异步或开销较大的操作时，这个方式是最有用的。\r\n\r\n这里主要是侦听URL的变化，来执行路由跳转。这里我之间写多了一个/home路由所以我直接跳到\"/home/page/1\" 这个路由去了.\r\n\r\n    router.push(\"/home/page/1\");\r\n\r\n    router.push 是vue-router的编程时导航写法，除了使用 <router-link> 创建 a 标签来定义导航链接，我们还可以借助 router 的实例方法，通过编写代码来实现。\r\nrouter.push(location)\r\n想要导航到不同的 URL，则使用 router.push 方法。这个方法会向 history 栈添加一个新的记录，所以，当用户点击浏览器后退按钮时，则回到之前的 URL。\r\n\r\n    this.$route.path\r\n    \r\n获取当前URL值\r\n\r\n    this.$http.get(\"/essay\")\r\n    \r\n而像这个就是vue-resource的使用，需要注意的是vue2.0后不再更新vue-resource了，官方推荐使用axios.','用Vue+Node.js搭建个人博客（一）---前端界面实现','Vue','2017-10-27 16:20:47',0,0);
/*!40000 ALTER TABLE `essay` ENABLE KEYS */;

#
# Structure for table "goods"
#

DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `good` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "goods"
#

/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(30,0);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

#
# Structure for table "sessions"
#

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sessions"
#

INSERT INTO `sessions` VALUES ('g6irZOsftA6oESVZu_CENLDzhbw00-nc',1509092891,'{\"cookie\":{\"originalMaxAge\":480000,\"expires\":\"2017-10-27T08:25:37.942Z\",\"httpOnly\":true,\"path\":\"/\"},\"Isgood\":[]}'),('hCH-3Mq94KiGmrpkMBSbzfwU4A9iFGu_',1509093221,'{\"cookie\":{\"originalMaxAge\":480000,\"expires\":\"2017-10-27T08:29:08.854Z\",\"httpOnly\":true,\"path\":\"/\"},\"Isgood\":[null,null,null,null,null,null,null,null,null,null,true],\"username\":\"是是是\",\"usermail\":\"是是是\"}'),('vh45PD8ZjjPUwB4yx8_F_7zqRxwWqsB_',1509092865,'{\"cookie\":{\"originalMaxAge\":480000,\"expires\":\"2017-10-27T08:19:55.594Z\",\"httpOnly\":true,\"path\":\"/\"},\"Isgood\":[]}');

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(255) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `website` varchar(20) NOT NULL,
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
