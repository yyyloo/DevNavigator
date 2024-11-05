import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import 'element-plus/theme-chalk/dark/css-vars.css'
import ElementPlus from 'element-plus'

import 'element-plus/dist/index.css'
import http from "./utils/http";
// createApp(App).use(router).use(ElementPlus).use(http).mount('#app')
const app = createApp(App);

// 使用 Element Plus 插件
app.use(ElementPlus);


// 使用 router 插件
app.use(router);

// 将 axios 实例挂载到 Vue 原型上
app.config.globalProperties.$http = http;

app.mount('#app');