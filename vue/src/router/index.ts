import { createRouter, createWebHistory } from "vue-router";
import HomeView from "@/views/home.vue";

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            name: "zhuye",
            path: "/",
            component: HomeView,
        },
        {
            name: "xinwen",
            path: "/news",
            component: () => import("@/views/news.vue"),
            children: [
                {
                    name: "xiangqing",
                    path: "detail",
                    component: () => import("@/views/detail.vue"),
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
