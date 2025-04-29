import { defineStore } from "pinia";
import { reactive } from "vue";
import { nanoid } from "nanoid";

let talkList = reactive<{ id: string; content: string }[]>([]);

export const useTalkStore = defineStore("talk", {
    actions: {
        getLoveTalk() {
            let id = nanoid();
            talkList.unshift({
                id: id,
                content: "你好 " + id,
            });
        },
    },
    state: () => {
        return {
            talkList: JSON.parse(
                JSON.stringify(
                    (localStorage.getItem("talkList") as string) || "[]"
                )
            ),
        };
    },
});
