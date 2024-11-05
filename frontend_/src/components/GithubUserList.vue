<template>
  <div class="user-list">
    <div v-for="(user, index) in users" :key="user.id" class="user-card" @click="showDetails(user)">

      <span class="user-index">{{ index + 1 }}.</span> <!-- 添加序号 -->
      <img :src="user.avatar_url" alt="User Avatar" class="user-avatar"/>
      <div class="user-info">

        <div class="user-stats">
          <span class="user-name">{{ user.github_username }}</span>


          <div class="user-rank">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em"
                 xmlns="http://www.w3.org/2000/svg">
              <path
                  d="M21 3h-4V2a1 1 0 0 0-1-1h-8a1 1 0 0 0-1 1v1H3a1 1 0 0 0-1 1v4a5.006 5.006 0 0 0 5 5.92 7.003 7.003 0 0 0 6 3.406V20H9a1 1 0 0 0-1 1v1h8v-1a1 1 0 0 0-1-1h-3v-3.674a7.003 7.003 0 0 0 6-3.406A5.006 5.006 0 0 0 22 8V4a1 1 0 0 0-1-1ZM5 8V5h2v6a3 3 0 0 1-2-3Zm14 0a3 3 0 0 1-2 2.816V5h2Z"></path>
            </svg>
            {{ Math.floor(user.talent_rank) }}
          </div>

          <span class="user-stat">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em"
                 xmlns="http://www.w3.org/2000/svg">
              <path
                  d="M3.5 8a5.5 5.5 0 1 1 8.596 4.547 9.005 9.005 0 0 1 5.9 8.18.751.751 0 0 1-1.5.045 7.5 7.5 0 0 0-14.993 0 .75.75 0 0 1-1.499-.044 9.005 9.005 0 0 1 5.9-8.181A5.496 5.496 0 0 1 3.5 8ZM9 4a4 4 0 1 0 0 8 4 4 0 0 0 0-8Zm8.29 4c-.148 0-.292.01-.434.03a.75.75 0 1 1-.212-1.484 4.53 4.53 0 0 1 3.38 8.097 6.69 6.69 0 0 1 3.956 6.107.75.75 0 0 1-1.5 0 5.193 5.193 0 0 0-3.696-4.972l-.534-.16v-1.676l.41-.209A3.03 3.03 0 0 0 17.29 8Z"></path>
            </svg>
            {{ user.followers }}
          </span>

          <span class="user-stat">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em"
                 xmlns="http://www.w3.org/2000/svg">
              <path
                  d="M12 .25a.75.75 0 0 1 .673.418l3.058 6.197 6.839.994a.75.75 0 0 1 .415 1.279l-4.948 4.823 1.168 6.811a.751.751 0 0 1-1.088.791L12 18.347l-6.117 3.216a.75.75 0 0 1-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 0 1 .416-1.28l6.838-.993L11.328.668A.75.75 0 0 1 12 .25Zm0 2.445L9.44 7.882a.75.75 0 0 1-.565.41l-5.725.832 4.143 4.038a.748.748 0 0 1 .215.664l-.978 5.702 5.121-2.692a.75.75 0 0 1 .698 0l5.12 2.692-.977-5.702a.748.748 0 0 1 .215-.664l4.143-4.038-5.725-.831a.75.75 0 0 1-.565-.41L12 2.694Z"></path>
            </svg>
            {{ user.stars_count }}
          </span>

          <span class="user-stat">
            <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em"
                 xmlns="http://www.w3.org/2000/svg">
              <path
                  d="M3 2.75A2.75 2.75 0 0 1 5.75 0h14.5a.75.75 0 0 1 .75.75v20.5a.75.75 0 0 1-.75.75h-6a.75.75 0 0 1 0-1.5h5.25v-4H6A1.5 1.5 0 0 0 4.5 18v.75c0 .716.43 1.334 1.05 1.605a.75.75 0 0 1-.6 1.374A3.251 3.251 0 0 1 3 18.75ZM19.5 1.5H5.75c-.69 0-1.25.56-1.25 1.25v12.651A2.989 2.989 0 0 1 6 15h13.5Z"></path>
              <path
                  d="M7 18.25a.25.25 0 0 1 .25-.25h5a.25.25 0 0 1 .25.25v5.01a.25.25 0 0 1-.397.201l-2.206-1.604a.25.25 0 0 0-.294 0L7.397 23.46a.25.25 0 0 1-.397-.2v-5.01Z"></path>
            </svg>
            {{ user.repo_count }}
          </span>

        </div>
      </div>
    </div>
  </div>

  <!-- 卡片弹窗 -->
  <transition name="fade">
    <div v-if="selectedUser" class="overlay" @click.self="closeCard">
      <div class="detail-card">
        <img :src="selectedUser.avatar_url" alt="User Avatar" class="user-avatar"/>
        <h3>{{ selectedUser.github_username }}</h3>

        <p>Followers: {{ selectedUser.followers }}</p>
        <p>Stars: {{ selectedUser.stars_count }}</p>
        <p>Commit Counts: {{ selectedUser.commit_count }}</p>
        <p>Repostory Counts: {{ selectedUser.repo_count }}</p>
        <p>Country: {{ selectedUser.country }}</p>


        <div class="flex-grow" style="flex-grow: 1;">
          <h3 class="font-bold pb-2">Top Languages</h3>
          <ul class="text-gray-300">
            <li class="language-item" v-for="(language, index) in selectedUser.languages" :key="index">
              <span class="language-color-dot" :style="{ backgroundColor: getRandomColor() }"></span> {{ language }}
            </li>
          </ul>
        </div>
        <!-- 添加更多详细信息 -->

        <div ><a :href="selectedUser.github_url" target="_blank" rel="noopener noreferrer"  style="margin-right: 10px;" >
          <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 16 16" height="1em" width="1em"
               xmlns="http://www.w3.org/2000/svg">
            <path
                d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"></path>
          </svg>
        </a><a :href="selectedUser.blog_url" target="_blank" rel="noopener noreferrer">
          <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em"
               xmlns="http://www.w3.org/2000/svg">
            <path
                d="M14.78 3.653a3.936 3.936 0 1 1 5.567 5.567l-3.627 3.627a3.936 3.936 0 0 1-5.88-.353.75.75 0 0 0-1.18.928 5.436 5.436 0 0 0 8.12.486l3.628-3.628a5.436 5.436 0 1 0-7.688-7.688l-3 3a.75.75 0 0 0 1.06 1.061l3-3Z"></path>
            <path
                d="M7.28 11.153a3.936 3.936 0 0 1 5.88.353.75.75 0 0 0 1.18-.928 5.436 5.436 0 0 0-8.12-.486L2.592 13.72a5.436 5.436 0 1 0 7.688 7.688l3-3a.75.75 0 1 0-1.06-1.06l-3 3a3.936 3.936 0 0 1-5.567-5.568l3.627-3.627Z"></path>
          </svg>
        </a>
        </div>

      </div>


    </div>
  </transition>


</template>


<script>
import 'flag-icons/css/flag-icons.min.css';
export default {

  props: {
    users: {
      type: Array,
      default: () => []
    }
  },
  data() {
    return {
      selectedUser: null, // 当前选择的用户
    };
  },
  methods: {
    showDetails(user) {
      this.selectedUser = user;
    },
    closeCard() {
      this.selectedUser = null;
    },
    // 随机生成颜色的函数
    getRandomColor() {
      return `#${Math.floor(Math.random() * 16777215).toString(16)}`;
    }
  }


};


</script>

<style scoped>
.user-card {
  border: 1px solid #444;
  border-radius: 10px;
  padding: 16px;
  margin: 8px;
  display: flex;
  align-items: center;
  background-color: #1e1e1e;
  color: #ffffff;
}

.user-index, .user-name {
  font-weight: bold;
  color: #ffffff;
  font-size: 1.2em;
}

.user-info {
  margin-left: 12px;
}

.user-stats {
  display: flex;
  gap: 12px;
  align-items: center;
  margin-top: 4px;
  color: #ffffff;
}

.user-stat {
  display: flex;
  align-items: center;
}

.user-avatar {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  border: 1px solid #777;
}

.fade-enter-active, .fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter, .fade-leave-to {
  opacity: 0;
}

.overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
}

.detail-card {
  background: #2e2e2e;
  color: #ffffff;
  padding: 20px;
  border-radius: 8px;
  width: 300px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
  border: 1px solid #444;
}

.detail-card h3, .detail-card p {
  color: #e0e0e0;
}

.icon-link svg {
  color: #ccc;
  margin-right: 10px;
}

.language-color-dot {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  margin-right: 8px;
  display: inline-block;
}

.language-item {
  display: flex;
  align-items: center;
  margin-bottom: 0.375rem;
}

.country-flag {
  font-size: 20px;
  margin-right: 5px;
}
</style>