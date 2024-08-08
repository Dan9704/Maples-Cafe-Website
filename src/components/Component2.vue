<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="12" md="8">
        <v-card class="elevation-5">
          <v-card-title class="text-center font-weight-bold italic" style="font-size: 30px; color: red;">
            Feedback
          </v-card-title>
          <v-card-subtitle class="text-center">
            We value your feedback and appreciate you taking the time to share your thoughts with us. Your feedback
            helps us improve our services to better serve you.
          </v-card-subtitle>

          <v-divider></v-divider>

          <v-card-text>
            <v-form @submit.prevent="submitForm">
              <div class="text-center mb-4">
                <v-rating v-model="rating" empty-icon="mdi-coffee-outline" full-icon="mdi-coffee" color="brown"
                  hover></v-rating>
              </div>

              <v-textarea v-model="description" label="Your review:" outlined></v-textarea>

              <v-alert v-if="sucMessage" color="success" outlined>{{ sucMessage }}</v-alert>
              <v-alert v-if="errMessage" color="error" outlined>{{ errMessage }}</v-alert>

              <v-btn @click="submitForm" type="submit" class="mt-4" color="primary" block>Submit</v-btn>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <!-- Feed back section -->
    <v-sheet class="reviews-section my-5">
      <v-card-item class="text-center">
        <v-card-title class="title-secondary">Feedback from our most-valued customers</v-card-title>
      </v-card-item>
      <!-- from here -->
      <v-card v-for="review in reviews" :key="review.id" class="review-card m-4 p-4">
        <v-card-title>Review {{ review.id }}</v-card-title>
        <v-rating v-model="review.rating" empty-icon="mdi-coffee-outline" full-icon="mdi-coffee" color="brown" readonly>
        </v-rating>
        <v-card-text class="review-text">{{ review.description }}</v-card-text>
      </v-card>
    </v-sheet>
  </v-container>
</template>

<script>
import '@mdi/font/css/materialdesignicons.css';
import 'bootstrap/dist/css/bootstrap.css';
import axios from 'axios'; // Add this line

export default {
  name: 'ComponentTwo',
  data() {
    return {
      rating: null,
      description: '',
      errMessage: '',
      sucMessage: '',
      reviews: [], 
    };
  },
  mounted() {
    this.fetchReviews();
  },
  methods: {
    validate() { 
      if (!this.rating) {
        this.errMessage = "Please provide a rating.";
        return false;
      }
      return true;
    },  /* eslint-disable */
    submitForm() {
      if (this.validate()) {
        const apiUrl = 'https://mercury.swin.edu.au/cos30043/s104357292/HDTASK/Coffee/src/resources/api_review.php/';
        fetch(apiUrl, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            rating: this.rating,
            description: this.description,
          }),
        })
          .then((response) => response.json())
          .then((data) => {
            console.log('Data successfully posted:', data);
            this.sucMessage = "Thank you very much for your feedback. We are striving everyday to provide better services!";
            this.resetForm();
            this.fetchReviews();
          })
          .catch((error) => {
            console.error('Error posting data:', error);
            this.errMessage = "An error occurred while submitting your feedback.";
          });
      }
    },
    resetForm() {
      this.rating = null;
      this.description = '';
      this.errMessage = '';
    },
    // Feedback Section
    fetchReviews() {
      axios
        .get('https://mercury.swin.edu.au/cos30043/s104357292/HDTASK/Coffee/src/resources/api_review.php/')
        .then((response) => {
          this.reviews = response.data;
        })
        .catch((error) => {
          console.log('Failed to load reviews:', error);
        });
    },
  },
};
</script>
