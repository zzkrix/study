<template>
    <div class="person">
        <h1>姓名：{{ name }}</h1>
        <h2>年龄：{{ age }}</h2>

        <button @click="changeName">Change Name</button>
        <button @click="changeAge">Change Age</button>
        <button @click="changeFullName">ChangeFullName</button>

        <!-- 通过 v-model 双向绑定 -->
        <input type="text" v-model="name" />
        <input type="number" v-model="age" />

        <div class="person-details">
            <p>人员信息：{{ fullName }}</p>
            <p>人员信息：{{ fullName }}</p>
            <p>人员信息：{{ fullName }}</p>
        </div>

        <div>
            <button @click="changeNum">点击递增：{{ num }}</button>
        </div>

        <!-- 使用 vue 的 ref 替换原生 html 的 id="title2" -->
        <!-- 避免与其他组件使用重名 ID 时导致的冲突 -->
        <h2 ref="title2">哈哈哈哈</h2>
        <button @click="showH2">点我输出 ref 属性对应的内容</button>
    </div>
</template>

<!-- setup 语法糖 -->
<script setup lang="ts" name="HelloWorld-123">
import {
    computed,
    onMounted,
    reactive,
    ref,
    toRefs,
    watch,
    watchEffect,
} from "vue";

let person = reactive({
    name: "zhangsan",
    age: 18,
});

// 通过 toRefs 将 reactive 对象结构为响应式引用
let { name, age } = toRefs(person);

function getFullName() {
    return `${name.value} - ${age.value}`;
}

// 通过 computed 计算属性实现双向绑定。
// 下面的写法计算属性是只读的，不能直接修改
// let fullName1 = computed(() => {
//     console.log("computed");
//     return getFullName();
// });

// 通过 get 和 set 实现实现可修改的计算属性
let fullName = computed({
    get: () => {
        console.log("computed");
        return getFullName();
    },
    set: (value) => {
        console.log("set");
        let [str1, str2] = value.split("-");
        name.value = str1;
        age.value = Number(str2);
    },
});

function changeFullName() {
    fullName.value = `${name.value.toUpperCase()}-999`;
}

function changeName() {
    name.value = "lisi";
}

function changeAge() {
    age.value += 1;
    person.age += 1;
}

// =========================================
// watch 情况一：监听 ref 定义的变量
let num = ref(0);
function changeNum() {
    num.value += 1;
}

let stopWatch = watch(num, (newValue, oldValue) => {
    console.log("watch num changed", newValue, oldValue);
    if (newValue > 10) {
        num.value = 0;
        stopWatch(); // 停止监听，下次刷新页面时才会重新监听
    }
});

// =========================================
// watch 情况二：监听对象的属性
let obj = ref({
    name: "zhangsan",
    age: 18,
});

watch(
    obj,
    (newValue, oldValue) => {
        console.log("watch obj changed", newValue, oldValue);
    },
    { deep: true, immediate: true, once: true }
    // deep: true 深度监听，当对象的属性变化时也会触发。
    // deep: false 默认，对象本身的地址变化时才会触发。
    // immediate: true 立即执行，页面刚刷新时就会执行一次。
    // once: true, 只执行一次，默认是 false
);

// =========================================
// watch 情况三：监听 reactive 对象的属性
let obj2 = reactive({
    name: "zhangsan",
    age: 18,
});

// 监视 reactive 对象时，默认时开启深度监听的，而且不能关闭，即 deep=false 不会生效
watch(obj2, (newValue, oldValue) => {
    console.log("watch obj2 changed", newValue, oldValue);
});

// =========================================
// watch 情况四：监听对象的某个值
let obj3 = reactive({
    name: "zhangsan",
    age: 18,
    car: {
        brand: "奔驰",
        price: 100000,
    },
});

// 建议 watch 第一个参数写函数的形式，且开启深度监视
// 否则当 car 被整个修改时不会触发 watch
watch(
    () => obj3.car,
    (newValue, oldValue) => {
        console.log("watch obj3 changed", newValue, oldValue);
    },
    { deep: true }
);

// =========================================
// watch 情况五：监听数组
let obj4 = reactive({
    name: "zhangsan",
    age: 18,
    car: [
        {
            brand: "奔驰",
            price: 100000,
        },
        {
            brand: "宝马",
            price: 200000,
        },
    ],
});

// 和上面一样，建议 watch 第一个参数写函数的形式，且开启深度监视
watch(
    [() => obj4.age, () => obj4.car],
    (newValue, oldValue) => {
        console.log("watch obj4 changed", newValue, oldValue);
    },
    { deep: true }
);

// =========================================
// watchEffect
let obj5 = reactive({
    name: "zhangsan",
    age: 18,
    car: [
        {
            brand: "奔驰",
            price: 100000,
        },
        {
            brand: "宝马",
            price: 200000,
        },
    ],
});

// watchEffect 不需要声明监听的是谁，可以之间在函数内写判断逻辑
// 但是 watchEffect 是立即执行的
watchEffect(() => {
    if (obj5.age > 20 || obj5.car.length > 0) {
        console.log("watchEffect", obj5.age, obj5.car);
    }
    console.log("watchEffect", obj5.age, obj5.car);
});

let title2 = ref();

// 通过 ref 定义的变量可以通过 value 属性访问
function showH2() {
    console.log("------", title2.value);
}

onMounted(() => {
    console.log("onMounted");
});
</script>

<style>
.person {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.person-details {
    display: flex;
    flex-direction: column;
    align-items: center;
}

button {
    margin: 10px;
    padding: 10px;
    background-color: #42b983;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

input {
    margin: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}
</style>
