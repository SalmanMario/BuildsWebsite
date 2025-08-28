import {createRouter, createWebHistory} from "vue-router";
import AdminLogin from "@/pages/admin/account/AdminLogin.vue";
import Dashboard from "@/pages/admin/Dashboard.vue";
import {useAuthStore} from "@/utils/auth.js";

const routes = [
    {
        path: "/admin",
        children: [
            {
                name: "dashboard",
                path: "dashboard",
                component: Dashboard,
                meta: {
                    pageTitle: "Dashboard",
                    requiresAuth: true,
                    requiresRole: 'admin'
                },
            }, {
                path: "login",
                name: "login",
                component: AdminLogin,
                meta: {
                    pageTitle: "Login",
                    requiresGuest: true
                }
            }, {
                path: "path-of-exile",
                name: "path-of-exile",
                component: () => import("../pages/admin/path-of-exile/PathOfExileLayout.vue"),
                children: [
                    {
                        path: "",
                        name: "path-of-exile.index",
                        component: () => import("../pages/admin/path-of-exile/ViewIndex.vue"),
                    },
                    {
                        path: "leagues",
                        name: "path-of-exile.leagues",
                        component: () => import("../pages/admin/path-of-exile/leagues/ViewIndex.vue")
                    }
                ]
            }
        ],
    }
];

const router = createRouter({
    history: createWebHistory(),
    routes,
})

router.beforeEach(async (to, from, next) => {
    if (to.meta?.pageTitle) {
        document.title = to.meta.pageTitle
    }
    const authStore = useAuthStore()

    if (!authStore.user) {
        await authStore.getUser();
    }

    const isAuthenticated = !!authStore.user;
    const userRole = authStore.user?.role;

    // if the user is logged and access a page that requires
    if (isAuthenticated && to.meta.requiresGuest) {
        return next("/admin")
    }

    // if the page needs a logged user, but the user is not logged, the user is redirected to login page
    if (to.meta.requiresAuth && !isAuthenticated) {
        return next("/admin/login")
    }

    // if the page requires a special role and the user doesn't have it, redirect to login
    if (to.meta.requiresAuth && to.meta.requiresRole && userRole !== to.meta.requiresRole) {
        return next("/admin/login")
    }

    next();
})

export default router;
