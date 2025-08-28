<script setup>
import {ref} from "vue";
import axios from "axios";
import {useRouter} from "vue-router";

const router = useRouter()
const account = ref({
    "email": "",
    "password": "",
});

const submitForm = (() => {
    axios.post("login", {
        email: account.value.email,
        password: account.value.password,
    }, {}).then(() => {
        router.replace("/admin");
    }).catch((error) => {
        console.log(error.response.data);
    })
})

</script>

<template>
    <form method="POST" @submit.prevent="submitForm"
          class="min-h-dvh flex items-center justify-center p-4">
        <div class="px-10 py-10 bg-neutral-800">
            <div class="grid grid-cols-1 md:grid-cols-2 max-w-4xl w-full rounded-2xl shadow-xl overflow-hidden">
                <div class="relative">
                    <img src="/public/images/login_page.jpg" alt="Login"
                         class="w-full h-64 md:h-full object-cover">
                </div>
                <div class="p-8 md:p-12 ">
                    <h1 class="text-center font-bold mb-6">Login</h1>
                    <input type="email" placeholder="Email"
                           class="input input-xl w-full mb-4" v-model="account.email" required>
                    <input type="password" placeholder="Password"
                           class="input input-xl w-full mb-6" v-model="account.password" required>
                    <button class="btn btn-primary w-full">Login</button>
                </div>
            </div>
        </div>
    </form>
</template>

<style scoped>
</style>
