import {createApp} from "vue";
import App from "./App.vue";
import router from "./router/route.js";

import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import "../css/app.css"
import {createPinia} from "pinia";

const vuetify = createVuetify({
    components,
    directives,
})

async function init() {
    const app = createApp(App);
    const pinia = createPinia()
    app.use(router);
    app.use(vuetify);
    app.use(pinia);
    app.mount("#app")
}

await init()
