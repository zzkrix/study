<template>
    <div class="talk">
        <button @click="talkStore.getLoveTalk">获取一条新内容</button>
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
