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
                { image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-6/442416240_1382991333102878_3269477440420033976_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-09Lj8BOrYUQ7kNvgGg82pl&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYA5_lVcxk8PgKSSx0oRJhBlfzi9OqkMNiP59MWftvsfAA&oe=665613AE" },
                { image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-6/441550837_1382991356436209_3394164229736843703_n.jpg?stp=cp6_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ceWmuA2V_w8Q7kNvgGyNyei&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYD6E1b1c2TRgcj3Frn30KB3MyycEz2bQaQujxllX8DUgA&oe=665603E3" },
                { image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-6/442468931_1382991336436211_5849122022070541514_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=NUX87zGkzXkQ7kNvgE0wkWn&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYAIXwOqqejZg1CvkHg110f1JWkkGEqIWkl8eE5ntRrlpg&oe=6655E26E" },
                { image: "https://scontent.fmel5-1.fna.fbcdn.net/v/t39.30808-6/442416240_1382991333102878_3269477440420033976_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=nwFDpAhLcOgQ7kNvgH-M4_D&_nc_ht=scontent.fmel5-1.fna&oh=00_AYCaFLVsc2a6jv5alfMuODLBKbj4TpgKeK4PX1NhBFaDjA&oe=664E2AAE" },
                { image: "https://scontent.fmel5-1.fna.fbcdn.net/v/t39.30808-6/411777748_6628716953906463_4449914814369191723_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_ohc=NsMF6B49eoQQ7kNvgFxtaPc&_nc_ht=scontent.fmel5-1.fna&oh=00_AYCsAIbBwtz2s14BlHtLAaRQgUPr3zIzQKj_YpED52wf6Q&oe=664E4D20" },
                { image: "https://scontent.fmel5-1.fna.fbcdn.net/v/t1.6435-9/117654967_129147805540855_1618866749024246503_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ErbGDYAe9lIQ7kNvgEFGTFv&_nc_ht=scontent.fmel5-1.fna&oh=00_AYDi6m9NOENBhVsX0JRCY0Q6osOMlJwDJBNBmJVKdvaDKg&oe=6666C5C6" },
                { image: "https://scontent.fmel5-1.fna.fbcdn.net/v/t39.30808-6/442468931_1382991336436211_5849122022070541514_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=M5arCUrSV20Q7kNvgFtFO4N&_nc_ht=scontent.fmel5-1.fna&oh=00_AYCvUE_nQFiWOiJXxOMJBvZ-xWiNy0Wgdn7NohC29AlSpQ&oe=664E31AE" }
            ],
            teamMembersSection: [
                {
                    name: 'Jade Huynh',
                    title: 'Store Owner',
                    description: 'Ordering fail: When life serves you lemons, but you wanted coffee. Guess I will just sip my mistake away! ☕️🥲',
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-1/362941346_6127445647366932_963808283621716169_n.jpg?stp=dst-jpg_p480x480&_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=5VHcAgQO24kQ7kNvgFBerKC&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYDHt4-GzoXUwtA7vjmfQNWfp24krIlJkBRT1BLBo3XQoA&oe=6656119D",
                },
                {
                    name: 'Giai Le',
                    title: 'Store Owner',
                    description: 'Over 20+ years experience as Chef in reputable international hotels and restaurants, Henry is a master.',
                    image: "https://scontent.fmel3-1.fna.fbcdn.net/v/t1.6435-1/46492656_327639714684015_1818785845172240384_n.jpg?stp=dst-jpg_s480x480&_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=zyEZ6GCiY5UQ7kNvgGOP5tr&_nc_ht=scontent.fmel3-1.fna&oh=00_AYBRwgCES4MPqQ6w694WGUe9VtbI4Km6_ZKfjSW40lY06A&oe=666678DC",
                },
                {
                    name: 'Annie Huynh',
                    title: 'Barista',
                    description: 'Annie Huynh brings warmth and expertise to the cafe, crafting delightful coffee creations with precision and care.',
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t1.6435-9/46492656_327639714684015_1818785845172240384_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ANhjvpk_hwYQ7kNvgEEJcw9&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYDDIGYu5TnjyF2PtmBAcpGYmf0kT6XT-Vqf0q9dTqMy9A&oe=66779272",
                },
                {
                    name: 'Troy Nguyen',
                    title: 'Barista',
                    description: 'Troy Nguyen\'s passion for coffee shines through in every cup, ensuring every customer enjoys a perfect brew.',
                    image: "https://scontent.fmel3-1.fna.fbcdn.net/v/t1.6435-1/54267979_848515782161164_9160304140079857664_n.jpg?stp=dst-jpg_p480x480&_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=9ek-8QI2iLcQ7kNvgFn8ORx&_nc_ht=scontent.fmel3-1.fna&oh=00_AYBHOdul0tM-ErOYg-Qc9ruG_ub3qNrnQrrJ1cOUNqilCg&oe=66668474",
                },
                {
                    name: 'Dan Nguyen',
                    title: 'Chef',
                    description: 'With culinary mastery and a creative touch, Dan Nguyen leads the kitchen with precision and innovation, delighting customers with every dish.',
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-1/382858886_1234767054591974_5991075178956068026_n.jpg?stp=dst-jpg_s480x480&_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=mmJ2UcCnW0oQ7kNvgFOS63j&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYDXGtqjXOc4eLoinN17vOFa4s7UIQ6BTzQCzO9_BcAWgA&oe=665604BC",
                },
                {
                    name: 'Ryan Vo',
                    title: 'Barista',
                    description: 'Ryan Vo\'s dedication to coffee excellence makes each visit to the cafe a memorable experience, one cup at a time.',
                    //image: require('@/img/ryan.jpeg')
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-1/353813923_6435474809848665_8130091924857220151_n.jpg?stp=dst-jpg_p480x480&_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=LMXzXqv17lQQ7kNvgEsSYb_&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYBML3Fkg1WFyi60UgWsi496haBwuIZo8MNmh4NXivzb7A&oe=6655FE3B",
                },
                {
                    name: 'Kieu Duong',
                    title: 'Head Chef',
                    description: 'Bringing passion and creativity to the kitchen, Chef Kieu Duong crafts culinary delights with finesse and expertise, ensuring every dish is a masterpiece.',
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-1/414999639_2540170409483207_8264277613387271799_n.jpg?stp=dst-jpg_s480x480&_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=EzOrRFx6ZFcQ7kNvgE_8H39&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYDw2mwnpiFQTV4LNkSFZAzdNPlyOPrIMl--lWm8WX4_2Q&oe=66560541",
                },
                {
                    name: 'Tommy Nguyen',
                    title: 'All-Rounder',
                    description: 'Tommy Nguyen is the versatile force behind the scenes, seamlessly switching between tasks to ensure smooth operations in the kitchen. With a passion for culinary excellence.',
                    image: "https://scontent.fcbr1-1.fna.fbcdn.net/v/t39.30808-1/325600904_1336685083793469_1297355103095435382_n.jpg?stp=dst-jpg_p480x480&_nc_cat=111&ccb=1-7&_nc_sid=5f2048&_nc_ohc=MdBNJ132QuwQ7kNvgHPtBkI&_nc_ht=scontent.fcbr1-1.fna&oh=00_AYB7LXncHDc2zcm-fy0_vgW4MbIrJS5mn_rDY_6u99UgaA&oe=6655ED3D",
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