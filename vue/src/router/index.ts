import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/home.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            name: "zhuye",
            path: "/home",
            component: HomeView,
        },
        {
            // 重定向
            path: "/",
            redirect: "/about",
        },
        {
            name: "xinwen",
            path: "/news",
            component: () => import("@/views/news.vue"),
            children: [
                {
                    name: "xiangqing",
                    path: "detail/:id/:title/:content?",
                    component: () => import("@/views/detail.vue"),

                    // 第一种写法：将路由收到的所有 params 参数，以 props 的形式传给 Detail 组件
                    // props: true,

                    // 第二种写法：将路由收到的 params/query 参数，以 props 的形式传给 Detail 组件
                    props: (route) => {
                        return route.params; // 但这个不如直接用 props: true
                        // return route.query;
                    },
                },
            ],
        },
        {
            name: "guanyu",
            path: "/about",
            component: () => import("@/views/about.vue"),
        },
    ],
});

export default router;
