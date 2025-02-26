<script setup>

</script>

<template>
    <v-footer class="bg-grey-darken-3 text-center d-flex flex-column footer">
        <div>
            <v-btn
                v-for="icon in icons"
                :key="icon"
                :icon="icon"
                class="mx-4"
                variant="text"
            ></v-btn>
        </div>

        <div class="pt-0">
            This website is a personal project created to archive my builds for Path of Exile, Diablo, Last Epoch and many more. All content is original and belongs to
            its respective owner. Unauthorized use, reproduction, or distribution without permission is prohibited.
            For inquiries or collaborations, feel free to reach out at xmariosalman@gmail.com.
        </div>

        <v-divider></v-divider>

        <div>
            {{ new Date().getFullYear() }} — <strong>Laravel + Vue Project</strong>
        </div>
    </v-footer>
</template>

<style>

</style>
