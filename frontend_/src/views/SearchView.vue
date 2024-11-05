<template>
  <FrontHeader></FrontHeader>
  <div
      style="display: flex; align-items: center; gap: 20px; height: 60px; border-bottom: 1px solid #dcdcdc; padding: 0 20px;">

    <!-- 国家选择框 -->
    <el-select v-model="value1" clearable placeholder="请选择国家" style="width: 200px;">
      <el-option
          v-for="item in countrys"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>

    <!-- 领域选择框 -->
    <el-select v-model="value2" clearable placeholder="请选择领域" style="width: 200px;">
      <el-option
          v-for="item in languages"
          :key="item.value"
          :label="item.label"
          :value="item.value">
      </el-option>
    </el-select>

    <!-- 搜索输入框 -->
    <el-input v-model="searchQuery" placeholder="GitHub Username" style="width: 200px;"/>

    <!-- 搜索按钮 -->
    <el-button class="custom-button" icon="el-icon-search" @click="goto(value1, value2)">Search</el-button>


  </div>

<!--  <GithubUserList></GithubUserList>-->

  <GithubUserList :users="userList" />

</template>

<style>

.custom-button {
  background-color: #3a3f44; /* 深灰色或略带蓝色的灰色 */
  color: #ffffff;
  border-color: #3a3f44;
  text-align: center;
  padding-left: 0;
  padding-right: 0;

}

.custom-button:hover {
  background-color: #50575e; /* 悬停效果 */
  border-color: #50575e;
}

</style>

<script>
import FrontHeader from "@/components/FrontHeader.vue";
import GithubUserList from "@/components/GithubUserList.vue";

export default {
  name: 'SearchView',
  components: {GithubUserList, FrontHeader},
  data() {
    return {
      languages: [], // 语言选项
      countrys: [], // 国家选项
      value1: '',
      value2: '',
      searchQuery: '',
      userList: []
    }
  },
  mounted() {
    this.getLanguages()
    this.getCountrys()
  },
  methods: {
    async getLanguages() {
      try {
        const response = await this.$http.get("/developer/domain/all");
        // this.languages = response.data.data;
        this.languages = response.data.data.map(item => ({
          value: item,
          label: item
        }));
        console.log(response)
      } catch (error) {
        console.error("Error loading types:", error);
      }

    },
    async getCountrys() {

      try {
        const response = await this.$http.get("/developer/countrys/all");
        this.countrys = response.data.data.map(item => ({
          value: item,
          label: item
        }));
      } catch (error) {
        console.error("Error loading types:", error);
      }

    },
   async  goto(country,languages) {
      // location.href=url
     this.query={}
     this.query.country=country
     this.query.languages=languages
     this.query.github_username=this.searchQuery

       try {
         const response = await this.$http.post("/developer/search",this.query);
         this.userList = response.data.data
       } catch (error) {
         console.error("Error loading types:", error);
       }


     }
  }
}
</script>
