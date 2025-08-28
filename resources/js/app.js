import {createApp} from "vue";
import App from "./App.vue";
import router from "./router/route.js";
import "../css/app.css"
import "@mdi/font/css/materialdesignicons.css"
import {createPinia} from "pinia";
import VueApexCharts from "vue3-apexcharts";

async function init() {
    const app = createApp(App);
    const pinia = createPinia()
    app.use(router);
    app.use(pinia);
    app.component("apexchart", VueApexCharts);
    app.mount("#app")
}

await init()
