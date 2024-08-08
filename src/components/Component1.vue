<template>
    <div>
      <!-- Dropdown button for selecting food or drink -->
      <v-card-item class="my-2">
        <v-select v-model="selectedCategory" :items="categories" label="Select Category"></v-select>
      </v-card-item>
  
      <!-- Search bar input field -->
      <v-text-field v-model="searchQuery" label="Search" outlined @input="filterItems"></v-text-field>
  
      <!-- Dropdown box for sorting by price -->
      <v-card-item class="my-2">
        <v-select v-model="priceSort" :items="priceSortOptions" label="Sort by Price" outlined></v-select>
      </v-card-item>
  
      <!-- Clear Filters button -->
      <v-card-item class="my-2">
        <v-btn @click="clearFilters" color="primary">Clear Filters</v-btn>
      </v-card-item>
  
      <v-card-item>
        <v-card-title>Menu of Maples Cafe</v-card-title>
        <v-card-subtitle></v-card-subtitle>
      </v-card-item>
      
      <v-card-item class="my-2">
        <v-sheet>
          <div class="container mx-auto align-items-center">
            <div class="row">
              <div class="col-lg-4 col-md-6 col-sm-12" v-for="(item, index) in paginatedItems" :key="index">
                <!-- First v-card-item for the image -->
                <v-card-item class="m-4 p-2 elevation-2 custom-card">
                  <v-img :src="item.image" :alt="item.title" class="card-image"></v-img>
                </v-card-item>
  
                <!-- Second v-card-item for the title and price -->
                <v-card-item class="m-4 p-2 elevation-2 custom-card">
                  <v-card-text class="text-center title-text" style="font-size: 24px; color: red; font-family: 'Pacifico', cursive;">
                    {{ item.title }} - ${{ item.price }}
                  </v-card-text>
                  <v-card-text class="text-center">{{ item.description }}</v-card-text>
                </v-card-item>
              </div>
            </div>
          </div>
        </v-sheet>
  
        <div class="col-md-12">
          <paginate
            :page-count="pageCount"
            :click-handler="setCurrentPage"
            :page-range="5"
            :margin-pages="1"
            :prev-text="'Prev'"
            :next-text="'Next'"
            :container-class="'pagination'"
            :page-class="'page-item'"
          ></paginate>
        </div>
  
        <v-pagination v-model="currentPage" :length="Math.ceil(filteredItems.length / itemsPerPage)" @input="setCurrentPage">
        </v-pagination>
      </v-card-item>
    </div>
  </template>
  
  <script>
  import 'bootstrap/dist/css/bootstrap.css';
  
  export default {
    name: 'ComponentOne',
    data() {
      return {
        drinkItems: [],
        foodItems: [],
        selectedCategory: 'Drink',
        categories: ['Food', 'Drink'],
        currentPage: 1,
        itemsPerPage: 6,
        searchQuery: '',
        priceSort: null, // Default price sort option
        priceSortOptions: ['Lowest to Highest', 'Highest to Lowest'],
      };
    },
    computed: {
      filteredItems() {
        // Filter items based on search query and selected category
        let filteredItems = this.filteredByCategory.filter(item =>
          item.title.toLowerCase().includes(this.searchQuery.toLowerCase())
        );
  
        // Sort items by price if priceSort option is selected
        if (this.priceSort === 'Lowest to Highest') {
          filteredItems.sort((a, b) => a.price - b.price);
        } else if (this.priceSort === 'Highest to Lowest') {
          filteredItems.sort((a, b) => b.price - a.price);
        }
        return filteredItems;
      },


      paginatedItems() {
            const startIndex = (this.currentPage - 1) * this.itemsPerPage;
            const endIndex = startIndex + this.itemsPerPage;
            return this.filteredItems.slice(startIndex, endIndex);
        },



      filteredByCategory() {
        // Filter items based on selected category
        return this.selectedCategory === 'Drink' ? this.drinkItems : this.foodItems;
      },
      pageCount() {
        return Math.ceil(this.filteredItems.length / this.itemsPerPage);
      }
    },
    mounted() {
      this.loadMenuItems();
    },
    methods: {
      loadMenuItems() {
        this.foodItems = require('@/assets/food.json');
        this.drinkItems = require('@/assets/drink.json');
      },
      setCurrentPage(page) {
        this.currentPage = page;
      },
      filterItems() {
        this.currentPage = 1; // Reset current page to 1 when filtering
      },
      clearFilters() {
        // Reset all filter values to their default states
        this.selectedCategory = 'Drink';
        this.searchQuery = '';
        this.priceSort = null;
      },
    }
  };
  </script>
  
  <style>
  .custom-card {
    aspect-ratio: 1 / 1;
  }
  
  @media (min-width: 600px) {
    .row {
      display: flex;
      flex-wrap: wrap;
    }
  
    .col-md-4 {
      flex: 0 0 33.3333%;
      max-width: 33.3333%;
    }
  }
  </style>
  