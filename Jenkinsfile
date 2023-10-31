def mvnCmd = "mvn -s configuration/settings.xml"
def templatePath = "cicd/template-acm.json"

def ocpUatSonarqubeUrl = ""

pipeline {
    agent {label 'customagent'}
    
    environment {
        PROJECT_NAME ="test-project"
        NAME = "firstbuild"
        ENV_DEV = "dev"
        QUAY_REPO_NAME_DEV="fuse-dev/dfdc"
        
        QUAY_URL="https://"
    }
    
    stages {
        stage('checkout'){
            steps {
                checkout scm
            }
        } //end of stage checkout
        
        
        stage('source code build') {
            steps {
                sh "${mvnCmd} clean package -Dsettings.security=configuration/settings-security.xml -DskipTests=true -Dversion=${env.BUILD_NUMBER}"
            }
        } //end of stage code compile
        
        stage ('buildconfig template') {
            steps{
                script{
                    
                        openshift.withCluster() {
                            openshift.withProject(env.PROJECT_NAME) {
                                def templateSelector = openshift.selector("template","${NAME}")
                                if(openshift.Selector("bc", [template : "${NAME}"]).exists()){
                                    openshift.selector("bc", "${NAME}".delete());
                                }
                                if(openshift.selector("is", [template : "${NAME}"]).exists()){
                                    openshift.selector("is", "${NAME}".delete());
                                }
                                
                                openshift.newApp(templatePath, "-p PROJECT_NAME=${env.PROJECT_NAME} -p NAME=${env.NAME}")
                            }
                            
                        }
                    }
                    
                }
            }
        }
    }
