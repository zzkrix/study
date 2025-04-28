<template>
    <div class="app">
        <!-- 标题 -->
        <h1>vue 学习</h1>

        <!-- 导航区 -->
        <div class="navigate">
            <RouterLink to="/">主页</RouterLink>
            <RouterLink :to="{ name: 'xinwen' }">新闻</RouterLink>
            <RouterLink to="/about">关于</RouterLink>
        </div>

        <!-- 展示区 -->
        <div class="main-content">
            <RouterView></RouterView>
        </div>
    </div>
</template>

<script setup lang="ts">
import { RouterLink, RouterView } from "vue-router";
</script>

<style scoped>
div.app {
    width: 100%;
    height: 100%;
    background-color: #fff;
    display: flex;
    flex-direction: column;
}

h1 {
    color: red;
    text-align: center;
    margin-bottom: 20px;
}

div.navigate {
    width: 100%;
    height: 50px;
    background-color: #ccc;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

div.navigate a {
    margin: 0 20px;
    text-decoration: none;
    color: #333;
    font-size: 16px;
    padding: 5px 15px;
    border-radius: 4px;
    transition: all 0.3s;
}

div.navigate a:hover {
    background-color: #666;
    color: white;
}

div.main-content {
    width: 100%;
    height: calc(100% - 70px);
    background-color: #eee;
    padding: 20px;
    box-sizing: border-box;
}
</style>
