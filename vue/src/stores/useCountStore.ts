import { defineStore } from "pinia";

export const useCountStore = defineStore("count", {
    actions: {
        add(value: number) {
            this.count += value;
        },
        reduce(value: number) {
            this.count -= value;
        },
        random() {
            this.count = Math.floor(Math.random() * 10);
        },
    },
    state: () => {
        return {
            count: 0,
            title: "abcasdaj1",
            addr: "beijing",
        };
    },
    // 相当于计算属性 computed
    // 调用时 不需要加括号
    // 依赖的 state 发生变化时，会重新计算
    getters: {
        double: (state) => state.count * 2,
        upperTitle(state): string {
            return state.title.toUpperCase();
        },
    },
});
