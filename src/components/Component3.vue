<template>
    <v-card-title class="text-center font-weight-bold italic" style="font-size: 30px; color: red;">Our Team</v-card-title>
    <v-card-subtitle class="text-center">Come meet the wonderful folks that make up our cozy team at Maples Cafe!</v-card-subtitle>
    <v-card-text class="my-4">
        <v-sheet max-width="900" class="mx-auto">
            <v-carousel cycle height="500" show-arrows show-arrows-on-hover>
                <v-carousel-item v-for="(item, index) in teamMembers" :key="index">
                  <v-sheet max-width="700" class="mx-auto">
                    <v-img :src="item.image" contain></v-img>
                  </v-sheet>
                </v-carousel-item>
              </v-carousel>
        </v-sheet>
    </v-card-text>

    <v-card-text class="my-4">
        <v-card-title class="text-center font-weight-bold italic" style="font-size: 30px; color: red;">Staffs</v-card-title>
        <v-row>
            <v-col cols="12" md="6" v-for="member in teamMembersSection" :key="member.name" class="d-flex">
                <v-card flat class="d-flex flex-row align-center">
                    <v-img :src="member.image" class="ma-3 rounded-circle" aspect-ratio="1" contain width="150px"></v-img>
                    <v-card-text>
                        <v-card-title class="headline font-weight-bold">{{ member.name }}</v-card-title>
                        <v-card-subtitle>{{ member.title }}</v-card-subtitle>
                        <v-card-text>{{ member.description }}</v-card-text>
                    </v-card-text>
                </v-card>
            </v-col>
        </v-row>
    </v-card-text>

    <v-card-title class="text-center font-weight-bold red--text italic" style="font-size: 30px; color: red;">We are hiring</v-card-title>
    <v-card-subtitle class="text-center">Join our cafe and be part of something special - Maples Cafe</v-card-subtitle>
    <v-card-text class="my-8">
        <v-sheet max-width="700" class="mx-auto">
            <v-form class="border elevation-4 rounded-lg p-3">
                <v-text-field v-model="name" label="Name"></v-text-field>
                <v-select v-model="position" :items="positions" label="Applied Position"></v-select>
                <v-select v-model="store" :items="stores" label="Applied Store"></v-select>

                <v-text-field v-model="address" label="Address"></v-text-field>
                <v-select v-model="gender" :items="genders" label="Gender"></v-select>
                <v-text-field v-model="education" label="Education"></v-text-field>
                <v-text-field v-model="experience" label="Experience"></v-text-field>

                <v-text-field v-model="email" label="Contact Email"></v-text-field>
                <v-text-field v-model="phone" label="Contact Phone"></v-text-field>
                <v-textarea v-model="description" label="Personal Description"></v-textarea>
                <v-alert color="#95D5B2" v-if="sucMessage !== ''" type="success" title="Completed" :text="sucMessage"></v-alert>
                <v-alert color="#ffccd5" v-if="errMessage !== ''" type="error" title="Invalid inputs" :text="errMessage"></v-alert>
                <v-btn @click="submitForm" type="button" class="mt-2" text="Submit Application" block></v-btn>
                <v-btn @click="resetForm" type="reset" class="mt-2" text="Reset" block></v-btn>
            </v-form>
        </v-sheet>
    </v-card-text>
</template>

<script>
import 'bootstrap/dist/css/bootstrap.css';
export default {
    name: 'ComponentThree',
    data() {
        return {
            name: '',
            position: '',
            store: '',
            positions: ['All Rounder', 'Head Chef', 'Head Barista', 'Cafe Manager'],
            stores: [
                'Footscray - Victoria',
            ],
            genders: ['Male', 'Female', 'Other'],
            email: '',
            phone: '',
            address: '',
            gender: '',
            education: '',
            experience: '',
            description: '',
            errMessage: '',
            sucMessage: '',
            teamMembers: [
                { image: require('@/img/team1.jpg'),  },
                { image: require('@/img/team2.jpeg'), },
                { image: require('@/img/team3.jpg'), },
                { image: require('@/img/team4.jpeg'), },
                { image: require('@/img/team5.jpg'), },
                { image: require('@/img/team6.jpeg'), },
            ],
            teamMembersSection: [
                {
                    name: 'Jade Huynh',
                    title: 'Store Owner',
                    description: 'Ordering fail: When life serves you lemons, but you wanted coffee. Guess I will just sip my mistake away! ☕️🥲',
                    image: require('@/img/jade.jpeg'),
                },
                {
                    name: 'Giai Le',
                    title: 'Store Owner',
                    description: 'Over 20+ years experience as Chef in reputable international hotels and restaurants, Henry is a master.',
                    image: require('@/img/giai.jpeg'),                
                },
                {
                    name: 'Annie Huynh',
                    title: 'Barista',
                    description: 'Annie Huynh brings warmth and expertise to the cafe, crafting delightful coffee creations with precision and care.',
                    image: require('@/img/annie.jpeg'),
                },
                {
                    name: 'Troy Nguyen',
                    title: 'Barista',
                    description: 'Troy Nguyen\'s passion for coffee shines through in every cup, ensuring every customer enjoys a perfect brew.',
                    image: require('@/img/troy.jpeg'),
                },
                {
                    name: 'Danny Nguyen',
                    title: 'Barista',
                    description: 'With culinary mastery and a creative touch, Dan Nguyen leads the kitchen with precision and innovation, delighting customers with every dish.',
                    image: require('@/img/dan.jpeg'),
                },
                {
                    name: 'Ryan Vo',
                    title: 'Barista',
                    description: 'Ryan Vo\'s dedication to coffee excellence makes each visit to the cafe a memorable experience, one cup at a time.',
                    image: require('@/img/ryan.jpeg')
                },
                {
                    name: 'Kieu Duong',
                    title: 'Head Chef',
                    description: 'Bringing passion and creativity to the kitchen, Chef Kieu Duong crafts culinary delights with finesse and expertise, ensuring every dish is a masterpiece.',
                    image: require('@/img/kieu.jpeg'),
                },
                {
                    name: 'Tommy Nguyen',
                    title: 'All-Rounder',
                    description: 'Tommy Nguyen is the versatile force behind the scenes, seamlessly switching between tasks to ensure smooth operations in the kitchen. With a passion for culinary excellence.',
                    image: require('@/img/tom.jpeg'),
                },
            ],
        };
    },
     methods: {
        validateForm() {
            this.errMessage = ''; // Clear previous error messages

            if (!this.name) {
                this.errMessage += ' Name is required.';
            }

            if (!this.address) {
                this.errMessage += ' Address is required.';
            }

            if (!this.gender) {
                this.errMessage += ' Gender is required.';
            }

            if (!this.education) {
                this.errMessage += ' Education is required.';
            }

            if (!this.experience) {
                this.errMessage += ' Experience is required.';
            }

            if (!this.position) {
                this.errMessage += ' Applied Position is required.';
            }

            if (!this.store) {
                this.errMessage += ' Applied Store is required.';
            }

            if (!this.email) {
                this.errMessage += ' Contact Email is required.';
            } else if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(this.email)) {
                this.errMessage += ' Invalid Contact Email.';
            }

            if (!this.phone) {
                this.errMessage += ' Contact Phone is required.';
            } else if (!/^\d{10}$/.test(this.phone)) {
                this.errMessage += ' Invalid Contact Phone. Please enter a 10-digit phone number.';
            }

            // Perform additional validation checks if needed

            return this.errMessage === ''; // Return true if no errors
        },

        submitForm() {
            if (this.validateForm()) {
                const apiUrl = 'https://mercury.swin.edu.au/cos30043/s104357292/HDTASK/Coffee/src/resources/api_apply.php/';
                fetch(apiUrl, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(this.application)
                })
                    .then(response => {return response.json()})
                    .then(data => {
                        console.log('Data successfully posted:', data);
                        // Handle the response data as needed
                    })
                    .catch(error => {
                        // Handle the error
                        this.errMessage = "Error: " + error;
                    });
                this.sucMessage = "Your registration has been submitted. We will catch you up soon!"
                this.resetForm();
            }
        },
        resetForm() {
            this.name = '';
            this.address = '';
            this.education = '';
            this.experience = '';
            this.position = '';
            this.store = '';
            this.email = '';
            this.phone = '';
            this.description = '';
            this.errMessage = '';
        }
    },
    computed: {
        application() {
            return {
                name: this.name,
                position: this.position,
                store: this.store,
                email: this.email,
                phone: this.phone,
                address: this.address,
                gender: this.gender,
                education: this.education,
                experience: this.experience,
                description: this.description
            }
        }
    }
};
</script>