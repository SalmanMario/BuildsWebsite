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
    <v-form method="POST" @submit.prevent="submitForm">
        <v-container class="d-flex justify-center align-center" style="max-width: 1200px; width: 100%; min-height: 100vh;">
            <v-sheet elevation="10" color="grey-darken-4" class="p-10 rounded-xl" style="width: 100%;">
                <h1 class="mb-5 text-center">Builds Codex</h1>
                <v-row justify="center" align="center">
                    <v-col cols="12" sm="12" md="6">
                        <v-img class="login-image" src="/images/login_page.jpg"></v-img>
                    </v-col>
                    <v-col cols="12" sm="12" md="6" class="d-flex flex-column align-center">
                        <h1 class="mb-5 text-center">Login</h1>
                        <v-text-field
                            class="login-field mb-5"
                            v-model="account.email"
                            type="email"
                            placeholder="Email"
                            variant="outlined"
                            style="max-width: 350px; width: 100%;"
                            required
                        ></v-text-field>
                        <v-text-field
                            class="login-field mb-5"
                            v-model="account.password"
                            type="password"
                            placeholder="Password"
                            variant="outlined"
                            style="max-width: 350px; width: 100%;"
                            required
                        ></v-text-field>
                        <div class="d-flex justify-center">
                            <v-btn class="login-btn" color="#424242" size="large" type="submit">Login</v-btn>
                        </div>
                    </v-col>
                </v-row>
            </v-sheet>
        </v-container>
    </v-form>
</template>

<style scoped>
.login-btn {
    font-family: Rubik, sans-serif;
    font-weight: 500;
}
</style>
