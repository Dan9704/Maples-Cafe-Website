<template>
    <v-container class="my-5">
      <v-card-item class="text-center my-5">
        <v-card-title class="title-main">
          Welcome to Maples Cafe - A Destination for Coffee and Check-in Loverss
        </v-card-title>
        <v-card-subtitle class="subtitle-main">
          Indulge in our curated selection of artisanal coffee blends and delectable pastries!
        </v-card-subtitle>
      </v-card-item>
  
      <!-- Drink Section -->
      <v-card-item class="drink-section m-2 p-3 elevation-4">
        <v-card-title class="title-secondary">
          SHOP OUR MOST POPULAR DRINKS        
          <!-- View Menu Button -->
          <v-btn color="primary" @click="$router.push('/menu')">VIEW MENU</v-btn>
        </v-card-title>
        <v-row justify="center" align="center">
          <v-col v-for="drink in randomDrinks" :key="drink.id" cols="12" sm="3">
            <transition name="fade">
              <v-img class="drink-image m-3" :src="drink.image" :alt="drink.name"></v-img>
            </transition>
            <v-card-title class="drink-title">{{ drink.title }}</v-card-title>
            <v-card-text class="drink-price">Price: ${{ drink.price }}</v-card-text>
          </v-col>
        </v-row>
      </v-card-item>
  
      <!-- Food Section -->
      <v-card-item class="food-section m-2 p-3 elevation-4">
        <v-card-title class="title-secondary">
          SHOP OUR MOST POPULAR FOODS
          <!-- View Menu Button -->
          <v-btn color="primary" @click="$router.push('/menu')">VIEW MENU</v-btn>
        </v-card-title>
        <v-row justify="center" align="center">
          <v-col v-for="food in randomFoods" :key="food.id" cols="12" sm="3">
            <transition name="fade">
              <v-img class="food-image m-3" :src="food.image" :alt="food.name"></v-img>
            </transition>
            <v-card-title class="food-title">{{ food.title }}</v-card-title>
            <v-card-text class="food-price">Price: ${{ food.price }}</v-card-text>
          </v-col>
        </v-row>
      </v-card-item>
  
      <!-- Location Section -->
      <v-card-item class="location-section m-2 p-3 elevation-4">
        <v-card-title class="title-secondary">
          OUR LOCATION
        </v-card-title>
        <v-row justify="center" align="center">
          <v-col cols="12" sm="6">
            <transition name="fade">
              <v-img class="location-image m-3" :src="location.image" :alt="location.name"></v-img>
            </transition>
            <v-card-title class="location-title">{{ location.name }}</v-card-title>
            <v-card-text class="location-address">{{ location.address }}</v-card-text>
          </v-col>
        </v-row>
      </v-card-item>
    </v-container>
  </template>
  
  <script>
  import 'bootstrap/dist/css/bootstrap.css';
  /* eslint-disable */
  export default {
    name: 'HomeComponent',
    data() {
      return {
        randomDrinks: [],
        randomFoods: [],
        location: {
          name: 'Maples Cafe - Nicholson Street Mall',
          address: 'Shop 4 109-111 Nicholson Street Footscray',
          image: require('@/img/location.jpeg'),
        },
      };
    },
    
    mounted() {
      this.randomDrinks = require('@/assets/drink.json');
      this.randomFoods = require('@/assets/food.json'); 
      this.generateRandomDrinks();
      this.generateRandomFoods();
    },
    methods: {
      
      /* eslint-disable */
      generateRandomDrinks() {
        const randomIndices = [];
        while (randomIndices.length < 4) {
          const randomIndex = Math.floor(Math.random() * this.randomDrinks.length);
          if (!randomIndices.includes(randomIndex)) {
            randomIndices.push(randomIndex);
          }
        }
        this.randomDrinks = randomIndices.map(index => this.randomDrinks[index]);
      },
      generateRandomFoods() {
        const randomIndices = [];
        while (randomIndices.length < 4) {
          const randomIndex = Math.floor(Math.random() * this.randomFoods.length);
          if (!randomIndices.includes(randomIndex)) {
            randomIndices.push(randomIndex);
          }
        }
        this.randomFoods = randomIndices.map(index => this.randomFoods[index]);
      }
    },
  };
  </script>
  
  <style scoped>
  @keyframes fade-in {
    0% {
      opacity: 0;
      transform: translateY(10px);
    }
    100% {
      opacity: 1;
      transform: translateY(0);
    }
  }
  
  .fade-enter-active, .fade-leave-active {
    transition: opacity 0.5s, transform 0.5s;
  }
  
  .fade-enter, .fade-leave-to {
    opacity: 0;
    transform: translateY(10px);
  }
  
  .title-main {
    font-size: 32px;
    color: #D32F2F;
    font-family: 'Arial, sans-serif';
    margin-bottom: 10px;
  }
  
  .subtitle-main {
    font-size: 20px;
    font-family: 'Courier New, monospace';
    color: #757575;
  }
  
  .title-secondary {
    font-size: 24px;
    font-family: 'Arial Black, sans-serif';
    font-weight: bold;
    color: #333;
  }
  
  .drink-section, .food-section, .location-section {
    background-color: #f5f5f5;
    border-radius: 8px;
  }
  
  .drink-image, .food-image, .location-image {
    border-radius: 8px;
    transition: transform 0.3s ease;
  }
  
  location-image {
    width: 200%;
    height: auto;
  }

  .drink-image:hover, .food-image:hover, .location-image:hover {
    transform: scale(1.05);
  }
  
  .drink-title, .food-title, .location-title {
    font-size: 20px;
    font-weight: bold;
    color: #424242;
  }
  
  .drink-price, .food-price, .location-address {
    font-size: 16px;
    color: #757575;
  }
  
  .reviews-section {
    background-color: #ffffff;
    border-radius: 8px;
    padding: 20px;
  }
  
  .review-card {
    border-radius: 8px;
    background-color: #f9f9f9;
  }
  
  .review-text {
    font-size: 16px;
    color: #616161;
  }
  
  .text-center {
    text-align: center;
  }
  </style>
  