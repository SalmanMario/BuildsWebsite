<script setup>
import {ref} from "vue";

const showSearch = ref(false);

const handleSearch = () => {
    showSearch.value = !showSearch.value;
}
</script>

<template>
    <div class="navbar bg-base-100 shadow-sm">
        <div class="flex-1">
            <RouterLink :to="{name: 'dashboard'}">
                <a class="btn btn-ghost text-xl">Builds Codex</a>
            </RouterLink>
        </div>
        <div class="flex-1">
            <RouterLink :to="{name: 'path-of-exile'}">
                <a class="btn btn-ghost text-xl">Home</a>
            </RouterLink>
        </div>
        <div class="flex gap-2">
            <input type="text" placeholder="Search" class="input input-bordered w-24 md:w-auto"/>
            <div class="dropdown dropdown-end">
                <div role="button" class="btn btn-ghost btn-circle">
                    <button class="w-10 rounded-full">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"
                             class="size-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                  d="M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.325.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 0 1 1.37.49l1.296 2.247a1.125 1.125 0 0 1-.26 1.431l-1.003.827c-.293.241-.438.613-.43.992a7.723 7.723 0 0 1 0 .255c-.008.378.137.75.43.991l1.004.827c.424.35.534.955.26 1.43l-1.298 2.247a1.125 1.125 0 0 1-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.47 6.47 0 0 1-.22.128c-.331.183-.581.495-.644.869l-.213 1.281c-.09.543-.56.94-1.11.94h-2.594c-.55 0-1.019-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 0 1-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 0 1-1.369-.49l-1.297-2.247a1.125 1.125 0 0 1 .26-1.431l1.004-.827c.292-.24.437-.613.43-.991a6.932 6.932 0 0 1 0-.255c.007-.38-.138-.751-.43-.992l-1.004-.827a1.125 1.125 0 0 1-.26-1.43l1.297-2.247a1.125 1.125 0 0 1 1.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.086.22-.128.332-.183.582-.495.644-.869l.214-1.28Z"/>
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z"/>
                        </svg>
                    </button>
                </div>
                <ul
                    tabindex="0"
                    class="menu menu-sm dropdown-content bg-base-100 rounded-box z-1 mt-3 w-52 p-2 shadow">
                    <li><a>Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--    <v-card>-->
    <!--        <v-layout>-->
    <!--            <v-app-bar height="100" class="navbar-background-color px-10" elevation="10">-->
    <!--                <v-toolbar-title class="text-h4 text-white font-700">BUILDS CODEX</v-toolbar-title>-->
    <!--                <v-btn class="text-h6 text-white font-700">-->
    <!--                    BUILDS-->
    <!--                </v-btn>-->
    <!--                <v-btn class="text-h6 text-white font-700" href="{{route}}">-->
    <!--                    <RouterLink :to="{name: 'path-of-exile.leagues'}">-->
    <!--                        LEAGUES-->
    <!--                    </RouterLink>-->
    <!--                </v-btn>-->
    <!--                <v-spacer></v-spacer>-->
    <!--                <v-expand-x-transition>-->
    <!--                    <div v-if="showSearch"-->
    <!--                         style="position: absolute; right: 120px; top: 50%; transform: translateY(-50%); width: 250px;">-->
    <!--                        <v-text-field-->
    <!--                            hide-details-->
    <!--                            class="login-field"-->
    <!--                            type="text"-->
    <!--                            placeholder="Build"-->
    <!--                            variant="outlined"-->
    <!--                            required-->
    <!--                        ></v-text-field>-->
    <!--                    </div>-->
    <!--                </v-expand-x-transition>-->
    <!--                <v-btn icon="mdi-magnify" variant="text" class="text-white" @click="handleSearch"></v-btn>-->
    <!--                <v-btn icon="mdi-dots-vertical" variant="text" class="text-white"></v-btn>-->
    <!--            </v-app-bar>-->
    <!--        </v-layout>-->
    <!--    </v-card>-->
</template>

<style scoped>
.navbar-background-color {
    background: radial-gradient(circle, rgba(51, 47, 47, 1) 0%, rgba(17, 16, 16, 1) 80%, rgba(0, 0, 0, 1) 100%);
}
</style>
