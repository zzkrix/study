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
        },
    ],
});

export default router;
