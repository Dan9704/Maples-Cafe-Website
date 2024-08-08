<template>
    <v-card-title>Admin Dashboard Page</v-card-title>
    <div v-if="loading">Loading...</div>
    <div v-else>
        <v-card-item title="Recent Applications">
            <!-- from here -->
            <v-card class="m-4 p-3" v-for="application in applications" :key="application.id">
                <v-card-title>Application {{ application.id }}</v-card-title>
                <!-- Delete Button -->
                <v-btn depressed v-on:click="delData(application.id)" color="primary">
                    Delete Candidate
                </v-btn>
                <v-card-subtitle>Position: {{ application.position }}. Store: {{ application.store }}</v-card-subtitle>
                <v-card-text>
                    <div id="{{ application.name }}">Name: {{ application.name }}</div>
                    <div>Contact email: {{ application.email }}</div>
                    <div>Contact phone: {{ application.phone }}</div>
                    <div>Address: {{ application.address }}</div>
                    <div>Education: {{ application.education }}</div>
                    <div>Experience: {{ application.experience }}</div>
                    <div>Submission date: {{ application.submission_date }}</div>
                    <div>Description: {{ application.description }}</div>
                </v-card-text>
            </v-card>
        </v-card-item>
    </div>
</template>

<script>
import axios from 'axios';
import 'bootstrap/dist/css/bootstrap.css';

export default {
    name: 'AdminDashboard',
    data: function() {
        return {
            application: [],
            loading: true
        };
    },
    mounted() {
        this.fetchApplications();
        // this.delData();
    },
    methods: {
        fetchApplications() {
            axios
                .get('https://mercury.swin.edu.au/cos20031/s104194774/duonghdtask/resources/api_apply.php/')
                .then(response => {
                    this.applications = response.data;
                    this.applications.reverse();
                    this.loading = false;
                })
                .catch(error => {
                    console.error('Failed to fetch applications:', error);
                    this.loading = false;
                });
        },

        /* eslint-disable */
        delData: function(id) {
            var delSQLApiURL = `https://mercury.swin.edu.au/cos20031/s104194774/duonghdtask/resources/api_apply.php/id/` + id;

            var self = this;
            // DELETE request using fetch with error handling
            const requestOptions = {
                method: 'DELETE',
                headers: {
                'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    name: id
                })
            };
                fetch(delSQLApiURL, requestOptions)
                .then( response =>{
                    //turning the response into the usable data
                    return response.json( );
                })
                .then( data =>{
                //This is the data you wanted to get from url
                console.log("Data deleted Successfully")
                })
                .catch(error => {
                    self.msg = 'There was an error!';
                    self.statusText = error;
                });	
        },
    }
};
</script>






