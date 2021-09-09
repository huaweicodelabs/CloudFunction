import Vue from 'vue'
import Router from 'vue-router'
import CloudFunction from '@/components/cloudfunction'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'cloudfunction',
      component: CloudFunction
    }
  ]
})
