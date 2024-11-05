// src/http.js

import axios from 'axios';

axios.defaults.withCredentials = true;

const http = axios.create({
      baseURL: 'http://172.27.96.62:8818',
     // baseURL: 'http://192.168.2.5:8080',
    timeout: 1000,
    headers: { 'Content-Type': 'application/json' ,
    }
});

// 请求拦截器
http.interceptors.request.use(
    config => {
        // 在发送请求之前可以做些什么，比如添加token
        console.log('Request Interceptor:', config);
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);

// 响应拦截器
http.interceptors.response.use(
    response => {
        // 对响应数据做些什么
        console.log('Response Interceptor:', response);
        return response;
    },
    error => {
        return Promise.reject(error);
    }
);

export default http