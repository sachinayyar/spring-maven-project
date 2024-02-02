#! /usr/bin/env groovy

pipeline {
  agent any
  tools {
    jdk 'java-17'
    maven 'maven 3.8.6'
  }

  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        
        sh 'mvn clean package -DskipTests=true'
      }
    }
  stage("Docker build"){
      steps{
        sh 'sudo docker version'
        sh 'sudo docker build -t ayyarsachin/first-demo-project .'
        sh 'docker image list'
        sh 'docker tag  ayyarsachin/first-demo-project ayyarsachin/first-demo-project:new'
    }
    }
    stage('Deployment') {
      steps {
        echo 'Deployment...'
        sh '''
            oc new-app docker.io/ayyarsachin/jen-pipeline:latest --name spring-app
            '''
      }
    }
    
//        script {
//
//          openshift.withCluster() { 
//  openshift.withProject("test-project") {
//  
//    def buildConfigExists = openshift.selector("bc", "codelikethewind").exists() 
//    
//    if(!buildConfigExists){ 
//      openshift.newBuild("--name=codelikethewind", "--docker-image=registry.redhat.io/jboss-eap-7/eap74-openjdk8-openshift-rhel7", "--binary") 
//    } 
//  
//    openshift.selector("bc", "codelikethewind").startBuild("--from-file=target/simple-servlet-0.0.1-SNAPSHOT.war", "--follow") } }
//
//       }
//      }
//    }


       
  }
}
