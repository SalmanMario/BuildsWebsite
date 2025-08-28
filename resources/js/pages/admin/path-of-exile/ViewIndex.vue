<script setup>

import axios from 'axios'
import {onMounted, ref} from "vue";

const type = "uniqueArmour"

const item = ref(null);
const explicitModifiers = ref(null);
const flavouredText = ref(null);
const showModifiers = ref(false);
onMounted(async () => {
    try {
        const resp = await axios.get(`http://localhost:3000/api/ninja/${type}`, {
            params: {league: 'Mercenaries', id: 118882}
        });
        console.log(resp.data)
        item.value = resp.data
    } catch (error) {
        console.log(error)
    }
})

function OnMouseEnter() {
    explicitModifiers.value = item.value.explicitModifiers.map((item) => item.text)
    flavouredText.value = item.value.flavourText
    showModifiers.value = true;
}

function OnMouseExit() {
    console.log("am iesit")
    showModifiers.value = false;
}

</script>

<template>
    <div v-if="item">
        <h1>{{ item.name }}</h1>
        <div>
            <img @mouseover="OnMouseEnter" @mouseleave=OnMouseExit() :src="item.icon" alt="">
            <div v-if="showModifiers" style="max-width: 300px;" class="container">
                <img class="img" :src="item.icon" alt="">
                <div class="mt-5" v-for="(text, index) in explicitModifiers" :key="index">
                    {{ text }}
                </div>
                {{flavouredText}}
            </div>
        </div>
    </div>
</template>

<style scoped>
.container {
    border: 5px #d14b0a solid;
    padding: 10px;
}
.img{
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
