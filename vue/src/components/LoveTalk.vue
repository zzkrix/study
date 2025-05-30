<template>
    <div class="talk">
        <button @click="talkStore.getLoveTalk">获取一条新内容</button>

        <button @click="clearLocalStorage">清除缓存</button>

        <ul>
            <li v-for="talk in talkList" :key="talk.id">
                {{ talk.content }}
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts" name="LoveTalk">
import { storeToRefs } from "pinia";
import { useTalkStore } from "@/stores/useTalkStore";

let talkStore = useTalkStore();

const { talkList } = storeToRefs(talkStore);

console.log("111111111111", talkList.value);

// 类似 watch
// 监听 store 中数据的变化
talkStore.$subscribe((mutate, state) => {
    console.log("talkStore changed", mutate, "#########", state);

    // 保存到本地存储
    /**
     * 本地存储只能存储字符串
     * 所以需要将数组转换为字符串
     */
    localStorage.setItem("talkList", JSON.stringify(state.talkList));
});

function clearLocalStorage() {
    localStorage.removeItem("talkList");

    // 如果不执行 $reset() ：
    // - 本地存储虽然被清除了
    // - 但是 store 中的状态（talkList）还保持着旧的数据
    // - 页面上的列表不会更新
    // - 只有在页面刷新后，才会显示为空列表（因为此时会重新从本地存储读取数据）
    // 所以这个 $reset() 的调用确保了：
    // 1. 数据的同步性（本地存储和 store 状态保持一致）
    // 2. 用户界面的即时更新（不需要刷新页面就能看到清空的效果）
    talkStore.$reset();
}
</script>

<style scoped>
div.talk {
    color: chocolate;
    border: 1px solid #ccc;
}

button {
    color: red;
    margin: 10px;
    border: 1px solid #ccc;
}
</style>
