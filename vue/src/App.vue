<template>
    <header>
        <div class="wrapper">
            <HelloWorld ref="son" msg="You did it!" />
            <button @click="handleClick">测试</button>
        </div>
    </header>
</template>

<script setup lang="ts">
import HelloWorld from "./components/HelloWorld.vue";
import { ref } from "vue";

let son = ref();

function handleClick() {
    console.log("handleClick", son.value);
    son.value.showH2();
    son.value.a += 1;
    son.value.b += 2;
}
</script>
