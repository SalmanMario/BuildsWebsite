<script setup>
import {onMounted} from "vue";
import {useAuthStore} from "@/utils/auth.js";
import FooterComponent from "@/components/FooterComponent.vue";

const authStore = useAuthStore()
onMounted(async () => {
    await authStore.getUser()
})
</script>

<style scoped>

</style>

<template>
    <div class="min-h-screen flex flex-col">
        <div class="flex-grow">
            <RouterView/>
        </div>
    </div>
    <FooterComponent class="mt-8"></FooterComponent>
</template>
