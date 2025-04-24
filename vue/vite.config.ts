import { fileURLToPath, URL } from "node:url";

import { defineConfig } from "vite";
import vue from "@vitejs/plugin-vue";
import vueDevTools from "vite-plugin-vue-devtools";

// npm install vite-plugin-vue-setup-extend -D
// 实现调试时 chrome 中的 vue 插件可以显示 setup 语法糖的组件名称
// <script setup lang="ts" name="HelloWorld-123">
import vueSetupExtend from "vite-plugin-vue-setup-extend";

// https://vite.dev/config/
export default defineConfig({
    plugins: [vue(), vueDevTools(), vueSetupExtend()],
    resolve: {
        alias: {
            "@": fileURLToPath(new URL("./src", import.meta.url)),
        },
    },
});
