import Vue from 'vue'
import Router from 'vue-router'
import VueResource from 'vue-resource'
import nav from '@/components/nav'
import profile from '@/components/profile'
import content from '@/components/content'
import contentBig from '@/components/contentBig'
import detailContent from '@/components/detailContent'
import about from '@/components/about'
import lyb from '@/components/lyb'

Vue.use(Router)
Vue.use(VueResource)

export default new Router({
    //mode: 'history',
    routes: [
        {
            path: "/home",
            components: {
                nav: nav,
                profile: profile,
                content: content
            },
            children: [
                {
                    path: "page/:listnum",
                    components: {
                        contentBig: contentBig
                    }
                }
            ]

        },
        {
            path: "/content/:listnum/:num",
            components: {
                detailContent: detailContent,
                nav:nav
            }

        },
        {
            path: "/JavaScript",
            components: {
                profile: profile,
                content: content,
                nav: nav, 
            },
            children: [
                {
                    path: "page/:listnum",
                    components: {
                        contentBig: contentBig
                    }
                }
            ]
        },
        {
            path: "/Node",
            components: {
                profile: profile,
                content: content,
                nav: nav,
            },
            children: [
                {
                    path: "page/:listnum",
                    components: {
                        contentBig: contentBig
                    }
                }
            ]
        },
        {
            path: "/Vue",
            components: {
                profile: profile,
                content: content,
                nav: nav,
            },
            children: [
                {
                    path: "page/:listnum",
                    components: {
                        contentBig: contentBig
                    }
                }
            ]
        },
        {
            path: "/about",
            components: {
                nav: nav,
                Aboutme: about

            }
        },
        {
            path: "/lyb",
            components: {
                nav: nav,
                lyb: lyb
            }
        }
        
      
        ]
})
