<template>
    <header>
        <div class="wrapper">
            <HelloWorld msg="You did it!" />
        </div>
    </header>
</template>

<script lang="ts">
import HelloWorld from "./components/HelloWorld.vue";

export default {
    name: "App",
    components: {
        HelloWorld,
    },
};
</script>
