import { defineStore } from "pinia";
import { nanoid } from "nanoid";

export const useTalkStore = defineStore("talk", {
    actions: {
        getLoveTalk() {
            let id = nanoid();
            this.talkList.unshift({  // 使用 this 访问 store 的 state
                id: id,
                content: "你好 " + id,
            });
        },
    },
    state: () => {
        return {
            talkList: JSON.parse(
                localStorage.getItem("talkList") || "[]"
            ) as { id: string; content: string }[],
        };
    },
});
