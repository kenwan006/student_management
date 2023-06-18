<template>
    <tr>
      <td>{{ student.number }}</td>
      <td v-if="!isEdited">{{ student.name }}</td>
      <td v-if="!isEdited">{{ student.age }}</td>
      <td v-if="!isEdited">{{ student.place }}</td>
      <td v-if="!isEdited">{{ student.chi }}</td>
      <td v-if="!isEdited">{{ student.math }}</td>
      <td v-if="!isEdited">{{ student.eng }}</td>
      <td v-if="!isEdited">
        <el-button type="primary" icon="el-icon-edit" circle @click="edit"></el-button>
        <el-button type="danger" icon="el-icon-delete" circle @click="handleDelete"></el-button>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model.number="student.name" class="w-75"></el-input>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model.number="student.age" class="w-50"></el-input>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model="student.place" class="w-75"></el-input>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model.number="student.chi" class="w-50"></el-input>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model.number="student.math" class="w-50"></el-input>
      </td>
      <td v-if="isEdited">
        <el-input type="text" v-model.number="student.eng" class="w-50"></el-input>
      </td>
      <td v-if="isEdited">
        <el-button type="success" icon="el-icon-check" circle @click="save"></el-button>
        <el-button type="danger" icon="el-icon-delete" circle @click="handleDelete"></el-button>
      </td>
    </tr>
  </template>
  
  <script>
  import axios from 'axios'
  
  export default {
    name: 'StudentItem',
    props: ['studentCopy'],
    data() {
      return {
        isEdited: false,
        student: { ...this.studentCopy }
      }
    },
    methods: {
        edit(){
            this.isEdited=true;
            console.log(this.$route.params);
        },
        async save() {
            const updatedStudent = Object.assign({}, this.student);
            if (updatedStudent.age > 100 || updatedStudent.age < 0) {
                this.$alert('Illegal Ange', 'Alert Messge', {
                    confirmButtonText: 'OK',
                });
            } else if (updatedStudent.chi > 100 || updatedStudent.chi < 0) {
                this.$alert('Grade has to be 0 ~100！', 'Alert Message', {
                    confirmButtonText: 'OK',
                });
            } else if (updatedStudent.math > 100 || updatedStudent.math < 0) {
                this.$alert('Grade has to be 0 ~100！', 'Alert Message', {
                    confirmButtonText: 'OK',
                });
            } else if (updatedStudent.eng > 100 || updatedStudent.eng < 0) {
                this.$alert('Grade has to be 0 ~100！', 'Alert Message', {
                    confirmButtonText: 'OK',
                });
            } else {
                await axios({
                    url: "http://localhost:8080/update",
                    method: "POST",
                    data: updatedStudent
                })
                this.isEdited = false;
            }
        },

        handleDelete(){
          this.$confirm('File to be deleted permanently, continue?', 'Alert Message', {
          confirmButtonText: 'Confirm',
          cancelButtonText: 'Cancel',
          type: 'warning'
        }).then(async () => {
          await  axios({
                url:"http://localhost:8080/delete/",
                method: 'POST',
                data:{
                    id:this.student.id
                }
            })
            this.$emit('reloadTable');
            this.$message({
                type: 'success',
                message: 'Delete Success!'
            });
            }).catch(() => {
            this.$message({
                type: 'info',
                message: 'Delete cancelled'
            });          
            });
        }
    },
}
</script>

<style scoped>
    input{
        height:30px
    }
    td{
        width:60px
    }
</style>