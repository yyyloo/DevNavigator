import { createRouter, createWebHistory } from 'vue-router'


import HomeView from "@/views/HomeView.vue";
import AboutView from "@/views/AboutView.vue";
import SearchView from "@/views/SearchView.vue";
const routes = [
    {
        path: '/home',
        name: 'HomeView',
        component: HomeView
    },
    {
        path: '/',
        name: 'HomeView1',
        redirect: 'home',
    },
    {
        path: '/search',
        name: 'SearchView',
        component: SearchView,
    },
    {
        path: '/about',
        name: 'About',
        component: AboutView,
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
