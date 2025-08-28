<script setup lang="ts">
const props = defineProps({
    'title': String,
    'img': String,
})
</script>

<template>
    <div class="card bg-base-100 w-96 shadow-sm card-dashboard">
        <figure>
            <img
                :src="props.img"
                alt="image"
                class="card-dashboard-logo"
            />
        </figure>
        <div class="card-body">
            <h2 class="card-dashboard-title text-center">{{ props.title }}</h2>
        </div>
    </div>
</template>

<style scoped>

</style>
