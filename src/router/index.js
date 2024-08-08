import { createRouter, createWebHistory } from 'vue-router'
import ComponentOneView from '@/views/ComponentOneView.vue'
import ComponentTwoView from '@/views/ComponentTwoView.vue'
import ComponentThreeView from '@/views/ComponentThreeView.vue'
import ComponentFourView from '@/views/ComponentFourView.vue'
import HomeView from '@/views/HomeView.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: HomeView
  },
  {
    path: '/componentOne',
    name: 'componentOne',
    component: ComponentOneView
  },
  {
    path: '/componentTwo',
    name: 'componentTwo',
    component: ComponentTwoView
  },
  {
    path: '/componentThree',
    name: 'componentThree',
    component: ComponentThreeView
  },
  {
    path: '/componentFour',
    name: 'componentFour',
    component: ComponentFourView
  },
  {
    path: '/menu',
    name: 'Menu',
    component: ComponentOneView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
