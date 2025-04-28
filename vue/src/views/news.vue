<template>
    <div class="news">
        <!-- 导航区 -->
        <ul>
            <li v-for="news in newsList" :key="news.id">
                <!-- 第一种传参写法 -->
                <!-- <RouterLink
                    :to="`/news/detail?id=${news.id}&title=${news.title}&content=${news.content}`"
                    >{{ news.title }}</RouterLink
                > -->

                <!-- 第二种传参写法 -->
                <router-link
                    :to="{
                        name: 'xiangqing',
                        query: {
                            id: news.id,
                            title: news.title,
                            content: news.content,
                        },
                    }"
                    >{{ news.title }}</router-link
                >
            </li>
        </ul>

        <!-- 展示区 -->
        <div class="news-content">
            <router-view></router-view>
        </div>
    </div>
</template>

<script lang="ts" setup name="home">
import { reactive } from "vue";
// router-link、router-view 和 RouterLink、RouterView 组件是全局注册的，不需要导入
// 一般推荐使用小写的方式
// import { RouterLink, RouterView } from "vue-router";

let newsList = reactive([
    { id: 1, title: "新闻 1", content: "新闻 1 的内容" },
    { id: 2, title: "新闻 2", content: "新闻 2 的内容" },
    { id: 3, title: "新闻 3", content: "新闻 3 的内容" },
]);
</script>

<style scoped>
.news {
    display: flex;
}

.news ul {
    margin-top: 30px;
    /* list-style: none; */
    padding-left: 10px;
}

.news li::marker {
    color: seagreen;
}
</style>
