<template>
  <v-footer class="footer-background">
    <v-container class="text-center">
      <v-row>
        <v-col cols="12" class="mb-3">
          <v-card-title class="footer-title">Contact Us:</v-card-title>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" class="mb-3">
          <v-card-actions class="justify-center">
            <v-btn icon :href="'https://www.instagram.com/maples_cafe_footscray/'" target="_blank" v-tooltip.bottom="{ content: 'Follow us on Instagram' }">
              <v-icon class="footer-icon">mdi-instagram</v-icon>
            </v-btn>
            <v-btn icon :href="'https://www.facebook.com/maplescafefootscray'" target="_blank" v-tooltip.bottom="{ content: 'Like us on Facebook' }">
              <v-icon class="footer-icon">mdi-facebook</v-icon>
            </v-btn>
            <v-btn icon :href="'mailto:duongcrseven@gmail.com'" v-tooltip.bottom="{ content: 'Send us an email' }">
              <v-icon class="footer-icon">mdi-email</v-icon>
            </v-btn>
            <v-btn icon :href="'https://api.whatsapp.com/send?phone=yourphonenumber'" target="_blank" v-tooltip.bottom="{ content: 'Message us on WhatsApp' }">
              <v-icon class="footer-icon">mdi-whatsapp</v-icon>
            </v-btn>
            <v-btn icon :href="'tel:0488315327'" v-tooltip.bottom="{ content: 'Call us' }">
              <v-icon class="footer-icon">mdi-phone</v-icon>
            </v-btn>
          </v-card-actions>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="12" class="footer-text">
          <v-card-text>
            © 2024 Maples Cafe. All Rights Reserved.
          </v-card-text>
        </v-col>
      </v-row>
    </v-container>
  </v-footer>
</template>

<script>
export default {
  name: 'AppFooter',
};
</script>

<style scoped>
.footer-background {
  background-color: #333; 
  color: #fff;
  padding: 30px 0; 
  position: relative; 
  overflow: hidden; 
}

.footer-background::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(255,204,0,0.1) 0%, rgba(255,204,0,0.3) 100%);
  opacity: 0.5;
  z-index: 0;
}

.footer-title {
  font-size: 28px;
  font-weight: bold; 
  color: #ffcc00; 
  text-transform: uppercase; 
  letter-spacing: 2px; 
  position: relative; 
  z-index: 1;
}

.footer-icon {
  font-size: 26px;
  color: #ffcc00; 
  transition: transform 0.3s ease, color 0.3s ease; 
  z-index: 1; 
}

.footer-icon:hover {
  transform: scale(1.2); 
  color: #fff; 
}

.footer-text {
  font-size: 16px; 
  color: #fff; 
  position: relative; 
  z-index: 1;
  margin-top: 20px;
}

.footer-background .v-card-actions .v-btn {
  margin: 0 10px; 
}

.footer-background .v-card-actions .v-btn:hover .footer-icon {
  color: #fff;
  transition: color 0.3s ease, transform 0.3s ease; 
}

@keyframes slideIn {
  0% {
    transform: translateY(20px);
    opacity: 0;
  }
  100% {
    transform: translateY(0);
    opacity: 1;
  }
}

.footer-title, .footer-icon, .footer-text {
  animation: slideIn 1s ease forwards;
}

.footer-icon:nth-child(1) {
  animation-delay: 0.2s; 
}

.footer-icon:nth-child(2) {
  animation-delay: 0.4s; 
}

.footer-icon:nth-child(3) {
  animation-delay: 0.6s;
}

.footer-icon:nth-child(4) {
  animation-delay: 0.8s;
}

.footer-icon:nth-child(5) {
  animation-delay: 1s; 
}
</style>
