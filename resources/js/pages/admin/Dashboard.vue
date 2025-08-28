<script setup>
import {useAuthStore} from "@/utils/auth.js";
import router from "@/router/route.js";
import axios from "axios";
import GameCardComponent from "@/components/cards/GameCardComponent.vue";

const authStore = useAuthStore()

const logout = (() => {
    axios.post("/admin/logout").then(async (response) => {
        console.log("here")
        await authStore.getUser()
        router.replace("/admin/login")
    })
})
</script>

<template>
    <form method="POST" @submit.prevent="logout">
        <button class="btn btn-primary btn-xl" type="submit">Logout</button>
    </form>
    <div class="flex min-h-dvh justify-center items-center">
        <div class="flex flex-wrap justify-center gap-10">
            <GameCardComponent title="Path of Exile 2" img="/images/poe2_logo.png"/>
            <RouterLink :to="{name: 'path-of-exile.index'}">
                <GameCardComponent title="Path of Exile" img="/images/poe_logo.png"/>
            </RouterLink>
            <GameCardComponent title="Last Epoch" img="/images/last_epoch_logo.png"/>
            <GameCardComponent title="Diablo IV" img="/images/diablo4_logo.png"/>
        </div>
    </div>
</template>

<style scoped>
</style>
