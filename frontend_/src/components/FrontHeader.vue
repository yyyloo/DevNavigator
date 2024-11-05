<template>
  <el-menu
      :default-active="activeIndex"
      class="el-menu-demo"
      mode="horizontal"
      :ellipsis="false"
      @select="handleSelect"
  >
    <el-menu-item index="0">
      <img
          class="menu-logo"
          src="/logo1.svg"
          alt="Element logo"
      />
    </el-menu-item>
    <el-menu-item index="1">Home</el-menu-item>
    <el-menu-item index="2">Search</el-menu-item>
    <el-menu-item index="3">About</el-menu-item>
  </el-menu>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
const router = useRouter()
const activeIndex = ref('-1')
const handleSelect = (key) => {
  if (key == 1) {
    router.push('/')
  } else if (key == 2) {
    router.push('/search')
  } else if (key == 3) {
    router.push('/about')
  }
}
</script>

<style>
.el-menu-demo {
  background-color: #333;
  color: #fff;
  font-family: 'Arial', sans-serif;
  border-bottom: 2px solid #4CAF50;
}

.el-menu--horizontal > .el-menu-item {
  padding: 0 20px;
  font-size: 16px;
  font-weight: 500;
  color: #b0b0b0;
  transition: color 0.3s, border-bottom 0.3s;
}

.el-menu--horizontal > .el-menu-item.is-active,
.el-menu--horizontal > .el-menu-item:hover {
  color: #4CAF50;
  border-bottom: 2px solid #4CAF50;
}

.menu-logo {
  width: 40px;
  height: auto;
  margin-right: auto;
  transition: transform 0.3s;
}

.menu-logo:hover {
  transform: scale(1.1);
}

.el-menu--horizontal > .el-menu-item:nth-child(1) {
  margin-right: auto;
}
</style>
