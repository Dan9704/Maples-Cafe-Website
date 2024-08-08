<template>
  <v-container>
    <v-app id="app">
      <AppHeader></AppHeader>
      <v-main>
        <v-card class="p-3">
          <!-- custom component views -->
          <router-view></router-view>
        </v-card>
      </v-main>
      <v-footer class="my-3 rounded elevation-1">
        <AppFooter></AppFooter>
      </v-footer>
    </v-app>
  </v-container>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css';
import AppHeader from './components/AppHeader.vue';
import AppFooter from './components/AppFooter.vue';

export default {
  components: {
    AppHeader,
    AppFooter
  },
};
</script>

<style>
#app {
  background-image: url('img/coffee.jpeg'); /* Local or online path */
  background-size: cover; /* Cover ensures the image covers the entire area */
  background-position: center; /* Center the image properly */
  background-repeat: no-repeat; /* Prevent image from repeating */
  font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
}
</style>
