<template>
    <ul class="news-list">
        <li>编号：{{ query.id }}</li>
        <li>标题：{{ query.title }}</li>
        <li>内容：{{ query.content }}</li>
    </ul>
</template>
<script lang="ts" setup name="detail">
import { useRoute } from "vue-router";
import { computed, toRefs } from "vue";

let route = useRoute();

// 错误的写法，会失去响应式
// let query = route.query;

// 正确的写法，不会失去响应式
// let query = computed(() => route.query);
let { query } = toRefs(route);
</script>

<style scoped></style>
