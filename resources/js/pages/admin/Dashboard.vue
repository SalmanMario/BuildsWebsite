<script setup>
import {useAuthStore} from "@/utils/auth.js";
import router from "@/router/route.js";
import axios from "axios";
import FooterComponent from "@/components/FooterComponent.vue";

const poe_logo = new URL("/src/assets/images/poe_logo.png", import.meta.url).href;
const authStore = useAuthStore()

const logout = (() => {
    axios.post("/admin/logout").then(async (response) => {
        await authStore.getUser()
        router.replace("/admin/login")
    })
})
</script>

<template>
    <v-container style="max-width: 1400px">
        <v-col class="d-flex justify-space-between align-center mb-8">
            <h1>Dashboard</h1>
            <v-form method="POST" @submit.prevent="logout">
                <v-btn class="login-btn" color="#424242" size="large" type="submit">Logout</v-btn>
            </v-form>
        </v-col>
        <v-row class="d-flex justify-center align-center">
            <v-col cols="12" sm="12" md="6" lg="3">
                <v-card height="300" color="grey-darken-3 card-dashboard">
                    <v-img src="/images/poe2_logo.png" alt="logo" class="card-dashboard-logo"/>
                    <v-card-title class="text-h4 text-center" style="white-space: normal">Path of Exile 2</v-card-title>
                </v-card>
            </v-col>
            <v-col cols="12" sm="12" md="6" lg="3">
                <v-card height="300" color="grey-darken-3 card-dashboard">
                    <v-img src="/images/poe_logo.png" alt="logo" class="card-dashboard-logo"/>
                    <v-card-title class="text-h4 text-center" style="white-space: normal">Path of Exile </v-card-title>
                </v-card>
            </v-col>
            <v-col cols="12" sm="12" md="6" lg="3">
                <v-card height="300" color="grey-darken-3 card-dashboard">
                    <v-img src="/images/last_epoch_logo.png" alt="logo" class="card-dashboard-logo"/>
                    <v-card-title class="text-h4 text-center" style="white-space: normal">Last Epoch </v-card-title>
                </v-card>
            </v-col>
            <v-col cols="12" sm="12" md="6" lg="3">
                <v-card height="300" color="grey-darken-3 card-dashboard">
                    <v-img src="/images/diablo4_logo.png" alt="logo" class="card-dashboard-logo"/>
                    <v-card-title class="text-h4 text-center" style="white-space: normal">Diablo 4 </v-card-title>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>

<style scoped>

</style>
