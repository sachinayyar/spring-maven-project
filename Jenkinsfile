#! /usr/bin/env groovy

pipeline {

  agent {
    label 'mymaven'
  }

  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        
        sh '/opt/maven/bin/mvn clean package'
      }
    }
    stage('Create Container Image') {
      steps {
        echo 'Create Container Image..'
        sh '''
            oc start-build -F spring-boot --from-dir=.
            '''
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
