<template>
  <FrontHeader></FrontHeader>

  <div class="content-container">
    <h1 class="title">Top GitHub Users</h1>
    <GithubUserList :users="userList" />
  </div>
</template>

<script>
import FrontHeader from "@/components/FrontHeader.vue";
import GithubUserList from "@/components/GithubUserList.vue";

export default {
  name: 'HomeView',
  components: {GithubUserList, FrontHeader},
  data() {
    return {
      userList: []
    }
  },
  mounted() {
    this.getTopUsers()
  },
  methods: {
    async getTopUsers() {
      try {
        const response = await this.$http.get("/developer/top");
        this.userList = response.data.data
        console.log(response)
      } catch (error) {
        console.error("Error loading users:", error);
      }
    }
  }
}
</script>

<style scoped>
.content-container {
  padding: 20px;
  max-width: 1000px;
  margin: 0 auto;
  text-align: center;
}

.title {
  font-size: 2.5em;
  font-weight: bold;
  color: #3c3c3c;
  margin-bottom: 20px;
  text-transform: uppercase;
  letter-spacing: 1px;
  position: relative;
}

.title::after {
  content: '';
  display: block;
  width: 60px;
  height: 4px;
  background-color: #42b983; /* or any color you prefer */
  margin: 10px auto 0;
  border-radius: 2px;
}
</style>
