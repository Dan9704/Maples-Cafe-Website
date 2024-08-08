<template>
    <v-card-item v-if="!authenticated">
      <v-card class="mx-auto my-5 py-5 px-4" max-width="600">
        <v-card-title class="text-center admin-login-title" style="font-size: 30px; color: black;">Admin Login</v-card-title>
        <v-card-text class="my-4">
          <v-sheet max-width="500" class="mx-auto">
            <v-form class="border elevation-4 rounded-lg p-5">
              <v-text-field
                v-model="input.username"
                label="Username"
                outlined
                class="mb-4"
              ></v-text-field>
              <v-text-field
                v-model="input.password"
                :append-icon="showPasswordInPlainText ? 'mdi-eye' : 'mdi-eye-off'"
                :type="showPasswordInPlainText ? 'text' : 'password'"
                name="input-10-1"
                label="Password"
                counter
                @click:append="showPasswordInPlainText = !showPasswordInPlainText"
                outlined
                class="mb-4"
              ></v-text-field>
              <v-alert
                v-if="errMessage !== ''"
                color="#ffccd5"
                type="error"
                title="Invalid Credentials"
                :text="errMessage"
                class="mb-4"
              ></v-alert>
              <v-btn
                @click="login()"
                color="success"
                type="button"
                class="mt-2"
                text="Login"
                block
              >Login</v-btn>
            </v-form>
          </v-sheet>
        </v-card-text>
      </v-card>
    </v-card-item>
    <v-card-item v-else>
      <AdminDashboard></AdminDashboard>
    </v-card-item>
  </template>
  

<script>
import AdminDashboard from './AdminDashboard.vue';
import 'bootstrap/dist/css/bootstrap.css';

export default {
    name: 'ComponentFour',
    components: {
        AdminDashboard
    },
    data() {
        return {
            showPasswordInPlainText: false,
            authenticated: false,
            errMessage: '',
            input: {
                username: '',
                password: ''
            },
        }
    },
    methods: {
        login() {
            fetch('https://mercury.swin.edu.au/cos30043/s104357292/HDTASKk/Coffee/src/resources/api_user.php/', {

                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    username: this.input.username,
                    password: this.input.password
                })
            })
            .then(response => response.json() )
            .then(data => {
                if (data == null) {
                    this.errMessage = 'Please try again.';
                } else {
                    this.authenticated= true;
                }
            })
            .catch(error => {
            this.errMessage = "Error: " + error;
            });
        }
    },
};
</script>