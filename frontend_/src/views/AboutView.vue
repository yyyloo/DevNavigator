<!--<template>-->
<!--  <FrontHeader></FrontHeader>-->
<!--  <div>-->
<!--    <h1>About</h1>-->
<!--    <main class="bg-thegray home-no-scroll ">-->
<!--      <div class="min-h-screen flex items-center justify-center relative ">-->
<!--        <div-->
<!--            class="absolute top-[24rem]  w-[45rem] h-[45rem] bg-blue-300 rounded-full filter blur-5xl opacity-50 animate-blob animation-delay-1"></div>-->
<!--        <div-->
<!--            class="absolute top-[24rem]  w-[30rem] h-[30rem] bg-blue-400 rounded-full filter blur-5xl opacity-30 animate-blob animation-delay-1"></div>-->
<!--        <div class="relative">-->
<!--          <div class="absolute flex justify-center globe-position pt-10 fade-in3">-->
<!--            <canvas id="cobe" class="z-0 mx-auto fade" width="1000" height="1000"-->
<!--                    style="width: 1000px; height: 1000px; opacity: 1; background-color: transparent; transition: opacity ease-out;"></canvas>-->
<!--          </div>-->
<!--          <div class="relative z-10 pt-0 pb-20">-->
<!--            <div class="HomeContainer "><h1-->
<!--                class="hidden md:block text-center pb-1 lg:pl-6 pointer-events-none select-none customFont text-7xl text-gray-100 leading-[1.1] max-w-[55rem] fade-in1">-->
<!--              Rank the top <span class="pr-10">software</span> <span class="pl-5">developers</span> by location.</h1>-->
<!--              <h1 class="md:hidden text-center pb-4 lg:pl-6 pointer-events-none select-none px-4 customFont text-5xl text-gray-100 leading-[1.1] max-w-[53rem ]">-->
<!--                Rank the top software developers by <span class="custom-text-shadow">location</span>.</h1>-->
<!--              <div-->
<!--                  class=" pb-4 select-none text-center font-Hublot text-gray-300 text-xl max-w-[33rem] leading-20 pt-4 fade-in2">-->
<!--                Start by entering the location you want to rank software developers from. Ranks are based on <span-->
<!--                  class="text-white"><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24"-->
<!--                                          class="inline align-text-bottom" height="1em" width="1em"-->
<!--                                          xmlns="http://www.w3.org/2000/svg"><path-->
<!--                  d="M3.5 8a5.5 5.5 0 1 1 8.596 4.547 9.005 9.005 0 0 1 5.9 8.18.751.751 0 0 1-1.5.045 7.5 7.5 0 0 0-14.993 0 .75.75 0 0 1-1.499-.044 9.005 9.005 0 0 1 5.9-8.181A5.496 5.496 0 0 1 3.5 8ZM9 4a4 4 0 1 0 0 8 4 4 0 0 0 0-8Zm8.29 4c-.148 0-.292.01-.434.03a.75.75 0 1 1-.212-1.484 4.53 4.53 0 0 1 3.38 8.097 6.69 6.69 0 0 1 3.956 6.107.75.75 0 0 1-1.5 0 5.193 5.193 0 0 0-3.696-4.972l-.534-.16v-1.676l.41-.209A3.03 3.03 0 0 0 17.29 8Z"></path></svg> followers</span>,-->
<!--                <span class="text-white"><svg stroke="currentColor" fill="currentColor" stroke-width="0"-->
<!--                                              viewBox="0 0 24 24" class="inline align-text-bottom" height="1em"-->
<!--                                              width="1em" xmlns="http://www.w3.org/2000/svg"><path-->
<!--                    d="M12 .25a.75.75 0 0 1 .673.418l3.058 6.197 6.839.994a.75.75 0 0 1 .415 1.279l-4.948 4.823 1.168 6.811a.751.751 0 0 1-1.088.791L12 18.347l-6.117 3.216a.75.75 0 0 1-1.088-.79l1.168-6.812-4.948-4.823a.75.75 0 0 1 .416-1.28l6.838-.993L11.328.668A.75.75 0 0 1 12 .25Zm0 2.445L9.44 7.882a.75.75 0 0 1-.565.41l-5.725.832 4.143 4.038a.748.748 0 0 1 .215.664l-.978 5.702 5.121-2.692a.75.75 0 0 1 .698 0l5.12 2.692-.977-5.702a.748.748 0 0 1 .215-.664l4.143-4.038-5.725-.831a.75.75 0 0 1-.565-.41L12 2.694Z"></path></svg> stars</span>,-->
<!--                <span class="text-white"><svg stroke="currentColor" fill="currentColor" stroke-width="0"-->
<!--                                              viewBox="0 0 24 24" class="inline align-text-bottom" height="1em"-->
<!--                                              width="1em" xmlns="http://www.w3.org/2000/svg"><path-->
<!--                    d="M16 19.25a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0Zm-14.5 0a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0Zm0-14.5a3.25 3.25 0 1 1 6.5 0 3.25 3.25 0 0 1-6.5 0ZM4.75 3a1.75 1.75 0 1 0 .001 3.501A1.75 1.75 0 0 0 4.75 3Zm0 14.5a1.75 1.75 0 1 0 .001 3.501A1.75 1.75 0 0 0 4.75 17.5Zm14.5 0a1.75 1.75 0 1 0 .001 3.501 1.75 1.75 0 0 0-.001-3.501Z"></path><path-->
<!--                    d="M13.405 1.72a.75.75 0 0 1 0 1.06L12.185 4h4.065A3.75 3.75 0 0 1 20 7.75v8.75a.75.75 0 0 1-1.5 0V7.75a2.25 2.25 0 0 0-2.25-2.25h-4.064l1.22 1.22a.75.75 0 0 1-1.061 1.06l-2.5-2.5a.75.75 0 0 1 0-1.06l2.5-2.5a.75.75 0 0 1 1.06 0ZM4.75 7.25A.75.75 0 0 1 5.5 8v8A.75.75 0 0 1 4 16V8a.75.75 0 0 1 .75-.75Z"></path></svg> commits</span>-->
<!--                and <span class="text-white"><svg stroke="currentColor" fill="currentColor" stroke-width="0"-->
<!--                                                  viewBox="0 0 24 24" class="inline align-text-bottom" height="1em"-->
<!--                                                  width="1em" xmlns="http://www.w3.org/2000/svg"><path-->
<!--                  d="M3 2.75A2.75 2.75 0 0 1 5.75 0h14.5a.75.75 0 0 1 .75.75v20.5a.75.75 0 0 1-.75.75h-6a.75.75 0 0 1 0-1.5h5.25v-4H6A1.5 1.5 0 0 0 4.5 18v.75c0 .716.43 1.334 1.05 1.605a.75.75 0 0 1-.6 1.374A3.251 3.251 0 0 1 3 18.75ZM19.5 1.5H5.75c-.69 0-1.25.56-1.25 1.25v12.651A2.989 2.989 0 0 1 6 15h13.5Z"></path><path-->
<!--                  d="M7 18.25a.25.25 0 0 1 .25-.25h5a.25.25 0 0 1 .25.25v5.01a.25.25 0 0 1-.397.201l-2.206-1.604a.25.25 0 0 0-.294 0L7.397 23.46a.25.25 0 0 1-.397-.2v-5.01Z"></path></svg> repos.</span>-->
<!--              </div>-->
<!--              <a class="get-started-button font-mono select-none fade-in3" href="/search">-->
<!--                <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512"-->
<!--                     class="inline align-text-top" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">-->
<!--                  <path-->
<!--                      d="M208 512l-52.38-139.62L16 320l139.62-52.38L208 128l52.38 139.62L400 320l-139.62 52.38zM88 176l-23.57-64.43L0 88l64.43-23.57L88 0l23.57 64.43L176 88l-64.43 23.57zm312 80l-31.11-80.89L288 144l80.89-31.11L400 32l31.11 80.89L512 144l-80.89 31.11z"></path>-->
<!--                </svg>-->
<!--                Get Started</a></div>-->
<!--          </div>-->
<!--        </div>-->
<!--        <a href="https://remise.ie" target="_blank" rel="noopener noreferrer"-->
<!--           class=" font-Hublot leading-12 tracking-wider pb-2 jack-sheehy"><span-->
<!--            class="text-gray-300 font-bold">REMISE </span> <br><span class="text-gray-400"> ©2023 </span></a></div>-->
<!--    </main>-->
<!--  </div>-->
<!--</template>-->

<!--<script>-->
<!--import FrontHeader from "@/components/FrontHeader.vue";-->

<!--export default {-->
<!--  name: 'AboutView',-->
<!--  components: {FrontHeader}-->
<!--}-->
<!--</script>-->


<template>
  <FrontHeader></FrontHeader>-->
  <div class="about-container">


    <h1>About DeveloperNavigator</h1>
    <p>
      <strong>DeveloperNavigator</strong> is a powerful and user-friendly platform designed to help users evaluate
      and rank developers based on their GitHub contributions and activity. Using cutting-edge search and ranking
      algorithms, DeveloperNavigator aggregates data to present a clear and insightful assessment of developers' technical
      expertise and influence across various domains.
    </p>

    <h2>Key Features</h2>
    <ul>
      <li>
        <strong>TalentRank Scoring:</strong> Our unique scoring system, <strong>TalentRank</strong>, quantifies a
        developer's technical impact and proficiency by analyzing project contributions, code quality, and community involvement.
      </li>
      <li>
        <strong>Intelligent Filtering:</strong> Search for developers based on specific domains, locations, or custom
        keywords to find top talent in specialized fields.
      </li>
      <li>
        <strong>Insightful Analytics:</strong> Get insights into developers’ expertise areas, languages used, and level
        of community engagement.
      </li>
      <li>
        <strong>Streamlined User Experience:</strong> A professional, tech-inspired interface in dark mode that offers
        an intuitive and seamless experience.
      </li>
    </ul>

    <h2>Why DeveloperNavigator?</h2>
    <p>
      DeveloperNavigator is more than just a search tool—it's designed for individuals and teams who want data-driven
      insights into developer capabilities. By combining AI and Elasticsearch, we provide accurate, up-to-date data
      for talent acquisition, team building, and network expansion.
    </p>

    <p>
      Explore <strong>DeveloperNavigator</strong> today and discover the best developers to support your project goals!
    </p>
  </div>
</template>

<script>
import FrontHeader from "@/components/FrontHeader.vue";

export default {
  name: 'AboutView',
  components: {FrontHeader}
}
</script>


<style scoped>
.about-container {
  //max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  color: #e0e0e0;
}

h1,
h2 {
  color: #4caf50;
}

ul {
  list-style-type: disc;
  margin-left: 20px;
}

strong {
  color: #ffd700;
}
</style>