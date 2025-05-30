<template>
    <div class="news">
        <!-- 导航区 -->
        <ul>
            <li v-for="news in newsList" :key="news.id">
                <button @click="showNewsDetail(news)">点击展示详情</button>
                <!-- 第一种传参写法 -->
                <!-- <RouterLink
                    :to="`/news/detail?id=${news.id}&title=${news.title}&content=${news.content}`"
                    >{{ news.title }}</RouterLink
                > -->

                <!-- 第二种传参写法 -->
                <router-link
                    :to="{
                        name: 'xiangqing',
                        // 针对的是路由种配置的 /detail/:id/:title/:content
                        params: {
                            id: news.id,
                            title: news.title,
                            content: news.content,
                        },
                        // 针对的是路由种配置的 /detail?id=1&title=2&content=3
                        // 但是这种方式不推荐，因为会暴露路由参数
                        // query: {
                        //     id: news.id,
                        //     title: news.title,
                        //     content: news.content,
                        // },
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

// 编程式路由导航
// 一般用在登录成功后，跳转到首页
// 一般用在按钮点击后，跳转到某个页面
// 鼠标划过跳转到某个页面等等
import { useRouter } from "vue-router";

interface NewInterface {
    id: number;
    title: string;
    content: string;
}

let router = useRouter();
function showNewsDetail(news: NewInterface) {
    // push 参数和 router-link 的 to 属性一致
    router.push({
        name: "xiangqing",
        // 针对的是路由种配置的 /detail/:id/:title/:content
        params: {
            id: news.id,
            title: news.title,
            content: news.content,
        },
    });
}
</script>

<style scoped>
.news {
    display: flex;
    width: 100%;
    height: 100%;
}

.news ul {
    margin-top: 30px;
    padding-left: 10px;
    width: 25%; /* 设置宽度为页面的四分之一 */
    border-right: 1px solid #ccc; /* 添加一个分隔线 */
    box-sizing: border-box; /* 确保边框不会增加总宽度 */
}

.news-content {
    flex: 1; /* 让内容区域占据剩余空间 */
    padding: 20px; /* 添加一些内边距 */
}

.news li::marker {
    color: seagreen;
}

/* 美化链接样式 */
.news a {
    text-decoration: none;
    color: #333;
    display: block;
    padding: 8px 0;
}

.news a:hover {
    color: #42b983;
}
</style>
