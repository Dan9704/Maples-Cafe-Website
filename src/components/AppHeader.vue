<template>
    <v-app-bar app color="#1e2832" dense>
      <v-toolbar-title>
        <span style="font-family: 'Roboto', sans-serif; font-weight: bold; color: white; font-size: 25px;">Maples Cafe</span> <!-- Inline styled text -->
      </v-toolbar-title>
      <v-tabs class="flex-grow-1" color="white" v-model="activeTab" centered>
        <v-tab style="color: white;" to="/">Home</v-tab>
        <v-tab style="color: white;" to="/componentOne">Menu</v-tab>
        <v-tab style="color: white;" to="/componentTwo">FeedBack</v-tab>
        <v-tab style="color: white;" to="/componentThree">Our Team</v-tab>
        <v-tab style="color: white;" to="/componentFour">Admin LogIn</v-tab>
      </v-tabs>
      <v-spacer></v-spacer> <!-- This will push all content to the edges -->
    </v-app-bar>
  </template>
  
  <script>
  export default {
    name: 'AppHeader',
    data() {
      return {
        activeTab: null
      };
    }
  };
  </script>


<style scoped>
.header-brand {
  font-family: 'Roboto', sans-serif;
  font-weight: bold;
  color: white;
  font-size: 20px;
}

.tab-item {
  color: white !important; 
}

</style>
  
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap');
</style>