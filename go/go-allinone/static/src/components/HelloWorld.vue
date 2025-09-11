<script setup>
import { ref } from "vue";
import { getHello } from "../api/index.js";

defineProps({
    msg: String,
});

const count = ref(0);
const apiMessage = ref("");
const isLoading = ref(false);
const hasError = ref(false);

async function callApiHello() {
    apiMessage.value = "";
    isLoading.value = true;
    hasError.value = false;

    try {
        const data = await getHello();
        apiMessage.value = data.message;
    } catch (error) {
        hasError.value = true;
        apiMessage.value = `调用失败：${error.message}`;
    } finally {
        isLoading.value = false;
    }
}
</script>

<template>
    <h1>{{ msg }}</h1>

    <div class="card">
        <button type="button" @click="count++">count is {{ count }}</button>
        <p>
            Edit
            <code>components/HelloWorld.vue</code> to test HMR
        </p>
    </div>

    <!-- 新增 API 调用按钮 -->
    <div class="card api-card">
        <h2>后端 API 调用</h2>
        <button type="button" @click="callApiHello" :disabled="isLoading">
            {{ isLoading ? "调用中..." : "调用 /api/hello" }}
        </button>

        <div v-if="apiMessage" class="api-result" :class="{ error: hasError }">
            <p>{{ apiMessage }}</p>
        </div>
    </div>

    <p>
        Check out
        <a href="https://vuejs.org/guide/quick-start.html#local" target="_blank"
            >create-vue</a
        >, the official Vue + Vite starter
    </p>
    <p>
        Learn more about IDE Support for Vue in the
        <a
            href="https://vuejs.org/guide/scaling-up/tooling.html#ide-support"
            target="_blank"
            >Vue Docs Scaling up Guide</a
        >.
    </p>
    <p class="read-the-docs">Click on the Vite and Vue logos to learn more</p>
</template>

<style scoped>
.read-the-docs {
    color: #888;
}

.api-card {
    margin-top: 2rem;
    padding: 1rem;
    border: 1px solid #933636;
    border-radius: 8px;
}

.api-result {
    margin-top: 1rem;
    padding: 0.5rem;
    background-color: #0f73cb;
    border-radius: 4px;
}

.api-result.error {
    background-color: #fff0f0;
    color: #e74c3c;
}
</style>
