<template>
  <div>
    <table class="table caption-top  table-hover">
        <caption>
            <span class="h5 text-dark">Student List</span>
            <span class="col-4 offset-3">
                <el-input class="w-25" placeholder="Please enter student's name" v-model="searchName"></el-input>
                <el-button type="primary" icon="el-icon-search" circle class="m-1" @click="searchStudent" v-show="!isSearched"></el-button>
                <el-button type="info" icon="el-icon-refresh-right" circle class="m-1" @click="backBeforeSearch" v-show="isSearched"></el-button>
            </span>
            <span class="col-1">
                <el-button type="warning" icon="el-icon-plus" circle @click="centerDialogVisible = true"></el-button>
                <!-- <el-button type="text" >点击打开 Dialog</el-button> -->

                    <el-dialog
                    title="Add Student"
                    :visible.sync="centerDialogVisible"
                    width="35%"
                    center>
                    <div class="text-center">
                        Student number:
                    <el-input v-model="newStudent.number" class="w-50" placeholder="Enter Number"></el-input>
                    </div>
                    <div class="mt-1 text-center">
                        Student Name:
                    <el-input v-model="newStudent.name" class="w-50" placeholder="Enter Name"></el-input>
                    </div>
                    <div class="mt-1 text-center">
                        Student Age:
                    <el-input v-model.number="newStudent.age" class="w-50" placeholder="Enter Age" type="text"></el-input>
                    </div>
                    <div class="mt-1 text-center">
                        Student birth place:
                    <el-input v-model="newStudent.place" class="w-50" placeholder="Enter Birth Place"></el-input>
                    </div>
                    <div class="mt-1 text-center">
                        Chinese Grade:
                    <el-input v-model.number="newStudent.chi" class="w-50" placeholder="Enter Chinese Grade" type="text"></el-input>
                    </div>
                    <div class="mt-1 text-center">
                        Math Grade:
                    <el-input v-model.number="newStudent.math" class="w-50" placeholder="Enter Math Grade" type="text"></el-input>
                    </div>
                    <div class="mt-2 text-center">
                        English Grade:
                    <el-input v-model.number="newStudent.eng" class="w-50" placeholder="Enter English Grade" type="text"></el-input>
                    </div>
                    <span slot="footer" class="dialog-footer">
                        <el-button @click="centerDialogVisible = false">Cancel</el-button>
                        <el-button type="primary" @click="addStudent">Add</el-button>
                    </span>
                    </el-dialog>
                <!-- <el-button type="warning" icon="el-icon-plus" circle @click="addStudent"></el-button> -->
            </span>
        
        </caption>
        <thead>
            <tr>
            <th scope="col">Number</th>
            <th scope="col">Name</th>
            <th scope="col">Age</th>
            <th scope="col">Place of Birth</th>
            <th scope="col">Chinese</th>
            <th scope="col">Math</th>
            <th scope="col">English</th>
            <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <StudentItem v-for="stu in students" :key="stu.id" :studentCopy="stu" v-on:reloadTable="updateTable"/>
        </tbody>
    </table>
    <el-pagination
    v-show="!isSearched"
    @size-change="handleSizeChange"
    @current-change="handleCurrentChange"
    :current-page="currentPage4"
    :page-sizes="[4,5,6]"
    :page-size="5"
    layout="total, sizes, prev, pager, next, jumper"
    :total="count"
    :i18n="{
        total: 'Total',
        sizes: 'Page Sizes',
        itemsPerPage: 'Items per page',
        currentPage: 'Current Page',
        goto: 'Go to',
        pageClassifier: ''
    }"
    ></el-pagination>
        <!-- <el-button-group v-show="!isSearched">
            <el-button type="primary" icon="el-icon-arrow-left" @click="lastPage">上一页</el-button>
            <el-input placeholder="页数"></el-input>
            <el-button type="primary" @click="nextPage">下一页<i class="el-icon-arrow-right el-icon--right"></i></el-button>
        </el-button-group> -->
  </div>
</template>

<script>
import axios from 'axios'
import StudentItem from "./StudentItem"
// import VNode from "./VNode"
export default {
    name:'StudentTable',
    data() {
        return {
            centerDialogVisible: false,
            students:[],
            page:1,
            count: 0,
            number_per_page:5,
            newStudent:{
                number:"", name:"", age:"", place:"",chi:"", math:"", eng:"",
            },
            searchName: "",
            
            isSearched:false,
        }
    },
  
    methods: {
        handleSizeChange(val) {
            console.log(`Each page has ${val} items`);
            this.number_per_page = val;
            axios({
              url: "http://localhost:8080/students",
              method: "POST", 
              data: {
                  page: this.page,
                  number_per_page: this.number_per_page
              }
            }).then(res => {
            this.students=res.data
           })
      },
      handleCurrentChange(val) {
          console.log(`Current: ${val}`);
          this.page = val
          axios({
              url: "http://localhost:8080/students",
              method: "POST", 
              data: {
                  page: this.page,
                  number_per_page: this.number_per_page
              }
          }).then(res => {
            this.students=res.data
           })

      },

      /** 
        nextPage() {
            if(this.page*5>=this.count){
                 this.$alert('没有下一页啦', '温馨提示', {
                confirmButtonText: '知道啦',
                });
            }
            else{
                this.page+=1;
                axios.get('http://localhost:8080/students/'+this.page).then(
                    response => {
                        this.students=response.data;
                    },
                    error =>{
                        console.log(error.massage);
                    }
                )
            }
            
        },
        lastPage(){
            if(this.page===1){
                this.$alert('这已经是第一页啦', '温馨提示', {
                confirmButtonText: '知道啦',
                });
            }
            else{
                this.page-=1;
                axios.get('http://localhost:8080/students/'+this.page).then(
                response => {
                    this.students=response.data;
                },
                error =>{
                    console.log(error.massage);
                }
            )
            }
        },
        **/
      async  addStudent(){
            if (this.newStudent.number==""||this.newStudent.name==""||this.newStudent.age===""||this.newStudent.chi===""||this.newStudent.math==="" || this.newStudent.eng==="") {
                this.$alert('Can not be empty!', 'Alert Message', {
                 confirmButtonText: 'OK',
                });
            }
            else if (this.newStudent.age<=0 || this.newStudent.age>150) {
                 this.$alert('It is not a valid age', 'Alert Message', {
                 confirmButtonText: 'OK',
                });
            }
            else if(this.newStudent.chi<0 || this.newStudent.chi>100){
                this.$alert('Grade has to be 0 ~ 100', 'Alert Message', {
                 confirmButtonText: 'OK',
                });
            }
            else if(this.newStudent.math<0 || this.newStudent.math>100){
                this.$alert('Grade has to be 0 ~ 100！', 'Alert Message', {
                 confirmButtonText: 'OK',
                });
            }else if(this.newStudent.eng<0 || this.newStudent.eng>100){
                this.$alert('Grade has to be 0 ~ 100', 'Alert Message', {
                 confirmButtonText: 'OK',
                });
            } 
            else{
               await axios({
                    url:"http://localhost:8080/add/",
                    method:"POST",
                    data:this.newStudent
                });
                this.$message({
                type: 'success',
                message: 'Add Success!'
            });
                this.centerDialogVisible=false;
             await  axios.get('http://localhost:8080/get_students_count/').then(
             response => {
                    this.count=parseInt(response.data);
                },
                error =>{
                    console.log(error.massage);
                })
               await this.updateTable();
            }
        },
        searchStudent(){
            
            // alert('http://localhost:8080/search?name='+this.searchName+"&")
            if (this.searchName==="") {
                this.$alert("Search content can not be empty","Alert Message",{
                    confirmButtonText: 'OK'
                })
            }
            else{
                axios({
                    url:"http://localhost:8080/search",
                    method:"POST",
                    data:{
                        name:this.searchName,
                    }
                }).then(
                    response => {
                        console.log(response.data);
                        // this.students=response.data.students;
                        this.students=response.data;
                        // alert(this.count);
                    },
                    error =>{
                        console.log(error.massage);
                    }
                )
                
                this.isSearched=true;
            }
        },
       backBeforeSearch(){
            this.searchName=""
            // axios.get('http://localhost:8080/students/'+this.page).then(
            //     response => {
            //         console.log(response.data);
            //         // this.students=response.data.students;
            //         this.students=response.data;
            //     },
            //     error =>{
            //         console.log(error.massage);
            //     }
            // );
            this.updateTable()
            this.isSearched=false;
        },
      async  updateTable() {
            // alert("表格更新")
          axios({
              url: "http://localhost:8080/students",
              method: "POST", 
              data: {
                  page: this.page,
                  number_per_page: this.number_per_page
              }
            }).then(res => {
            this.students=res.data;
            })
            axios.get('http://localhost:8080/get_students_count/').then(
                response => {
                    this.count=parseInt(response.data);
                },
                error =>{
                    console.log(error.massage);
                })
        },

    },
    components:{
        StudentItem
    },
    mounted() {
        axios({
              url: "http://localhost:8080/students",
              method: "POST", 
              data: {
                  page: this.page,
                  number_per_page: this.number_per_page
              }
            }).then(res => {
                this.students=res.data;
                console.log(this.students);
            })
        axios.get('http://localhost:8080/get_students_count/').then(
             response => {
                    this.count=parseInt(response.data);
                },
                error =>{
                    console.log(error.massage);
                })
    },
   async beforeRouteEnter (to, from, next) {
       if(sessionStorage.getItem('token')==null){
            alert("Please login first!")
       }else{
            await axios({
                url: "http://localhost:8080/checkToken",
                method: "POST",
                data: {
                    username: sessionStorage.getItem('username'),
                    token: sessionStorage.getItem('token')
                }
            }).then(res => {
                if (res.data=="1") {
                    next()
                }
                else{
                    alert("Login expired. Pleae login again")
                    location.reload();
                }
            })
       }
       
        // next()
    }
    

}
</script>

<style scoped>

</style>