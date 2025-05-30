<template>
    <div class="count">
        <h2>当前求和为{{ countStore.count }}</h2>
        <!-- 将用户选择的选项绑定到变量 n 上，并且转换成 number 类型 -->

        <h2>title：{{ title }}</h2>
        <h2>地址：{{ addr }}</h2>

        <!-- 使用 getters 定义后的用法 -->
        <!-- upperTitle 即可，不需要 upperTitle() -->
        <h2>title 大写：{{ upperTitle }}</h2>

        <select v-model.number="n">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>

        <button @click="countStore.add(n)">加</button>
        <button @click="countStore.reduce(n)">减</button>
    </div>
</template>

<script setup lang="ts" name="count">
import { ref } from "vue";
import { storeToRefs } from "pinia";
import { useCountStore } from "@/stores/useCountStore";
let countStore = useCountStore();

// 以下两种方式都可以获取到 count 的值
// console.log(countStore.count);
// console.log(countStore.$state.count);

let n = ref(1);

// // 建议使用 patch 批量修改 store 中的数据，提高性能
// countStore.$patch({
//     count: 100,
//     title: "hello",
//     addr: "beijing".toUpperCase(),
// });

// 解构出来后可以在模版中直接使用，不需要再 countStore.title 这种形式了
// 推荐使用 const, 以免在组件中修改 store 中的数据
// 如果需要修改，应该在 store 中定义一个方法去修改
// 使用 storeToRefs 保证解构出来的数据保持响应式
// 不使用 toRefs 是因为 toRefs 会把整个对象都变成 ref，而 storeToRefs 只会把需要的属性变成 ref
const { title, addr, upperTitle } = storeToRefs(countStore);
</script>

<style scoped>
.count {
    color: seagreen;
    padding: 10px;
    border: 1px solid #ccc;
}

select,
button {
    margin: 0 5px;
}
</style>
