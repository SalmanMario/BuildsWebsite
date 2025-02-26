import axios from "axios";
import {defineStore} from "pinia";

export const useAuthStore = defineStore("auth", {
    state: () => ({
        authUser: null,
        orderUser: null
    }),
    getters: {
        user: (state) => state.authUser,
        isLoggedIn: (state) => {
            return !!state.authUser?.id
        },
        isAdmin: (state) => {
            return state.authUser?.role === "admin"
        },
    }, actions: {
        async getUser() {
            const data = await axios.get("/api/auth");
            this.authUser = data.data
        },
    }, persist: true
})
