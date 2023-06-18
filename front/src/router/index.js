import VueRouter from 'vue-router'
// 引入组件
//import Students from '../components/Students'
import StudentTable from '../components/StudentTable'
import UserProfile from '../components/UserProfile'
import UserLogin from '../components/UserLogin'
import UserRegister from '../components/UserRegister'
import UserLogout from '../components/UserLogout'
import AnalysisReport from '../components/AnalysisReport'

// 创建一个路由器 
//import axios from 'axios'
const router = new VueRouter({
    mode:"history",
    routes: [
       
        {
            path: "/user",
            component: UserProfile,
            name: "user",
            children: [
                {
                    path: "login",
                    component: UserLogin,
                    name: "login",
                },
                {
                    path: "register",
                    component: UserRegister,
                    name: "register",
                }
            ]
        },
        {
            path: "/students",
            component: StudentTable,
            name: "students",
        },
        {
            path: "/logout",
            component: UserLogout,
            name: "logout",
        },
        {
            path: "/analysis",
            component: AnalysisReport,
            name: "analysis",
        }
        // {
        //     path: "/logout",
        //     component: Logout,
        //     name: "logout"
        // }
    ]
})

export default router