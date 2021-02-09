import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Element from '../views/Element.vue'
import Infinite from '../views/Infinite.vue'
import Test from '../views/Test.vue'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  {
    path: '/element',
    name: 'Element',
    component: Element
  },
  {
    path: '/infinite',
    name: 'Infinite',
    component: Infinite
  },
  {
    path: '/test',
    name: 'Test',
    component: Test
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
