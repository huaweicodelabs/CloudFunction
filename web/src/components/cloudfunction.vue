/*
 * Copyright 2020. Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
<template>
  <div class="cloudFunction-container">
    <el-form :model="functionDate" :rules="rules" status-icon label-position="left" label-width="80px"
             class="demo-ruleForm function-page">
      <h3 class="title">Cloud Function Codelab</h3>
      <el-form-item label="HttpTrigger" label-width="120px" >
        <el-input v-model="functionDate.HttpTrigger"></el-input>
      </el-form-item>
      <el-form-item label="Function Body"label-width="120px">
        <el-input type="textarea" v-model="functionDate.body"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width: 28%;" @click="runFunction">run</el-button>
      </el-form-item>
      <el-form-item label="result"label-width="120px">
        <el-input type="textarea" :disabled="true" v-model="functionDate.res"></el-input>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>

import agconnect from '@agconnect/api';
import '@agconnect/instance';
import '@agconnect/function';

export default {
  name: 'cloudfunction',
  data () {
    return {
      functionDate: {
        HttpTrigger: '',
        body:'',
        res:''
      },
      rules: {},
    };
  },
  async created() {
    var agConnectConfig =
      {
        
      };
    agconnect.instance().configInstance(agConnectConfig);
  },
  methods: {
    async runFunction(){
      agconnect.function().wrap(this.functionDate.HttpTrigger).call(this.functionDate.body).then(res=>{
        this.functionDate.res = JSON.stringify(res.getValue());
      }).catch(err=>{
        this.functionDate.res = JSON.stringify(err);
      });
    },
  }
}
</script>

<style scoped>
.cloudFunction-container {
  width: 100%;
  height: 100%;
}

.function-page {
  -webkit-border-radius: 5px;
  border-radius: 5px;
  margin: auto;
  width: 400px;
  padding: 35px 35px 15px;
  background: #fff;
  border: 1px solid #eaeaea;
  box-shadow: 0 0 25px #cac6c6;
}
</style>

