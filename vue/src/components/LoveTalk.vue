<template>
    <div class="talk">
        <button @click="getLoveTalk">获取一条新内容</button>
        <ul>
            <li v-for="talk in talkList" :key="talk.id">
                {{ talk.content }}
            </li>
        </ul>
    </div>
</template>

<script setup lang="ts" name="LoveTalk">
import { reactive } from "vue";
import { nanoid } from "nanoid";

let talkList = reactive<{ id: string; content: string }[]>([]);

function getLoveTalk() {
    let id = nanoid();
    talkList.unshift({
        id: id,
        content: "你好 " + id,
    });
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
