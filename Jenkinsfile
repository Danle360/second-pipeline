//http://3.138.154.32:8080/manage/configure
pipeline {
  agent any
  tools {
      maven 'UI_Maven3..9.9'
  }

  environment {
    containerName = "http://3.138.154.32:8085/mss-walmart-qa-app/"
    serviceName = "devsecops-svc"
    imageName = "siddharth67/numeric-app:${GIT_COMMIT}"
    applicationURL = "http://3.138.154.32:8085/mss-walmart-dev"
    deploymentName = "http://3.138.154.32:8085/mss-walmart-dev-app/"
    //containerName = "devsecops-container"
    //serviceName = "devsecops-svc"
  //  imageName = "siddharth67/numeric-app:${GIT_COMMIT}"
     jenkins_server_url = "http://3.138.154.32:8080/"
    mss_web_app = "/increment/99"
  }

  stages {
    stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'democalculus-github-login-creds', url: 'https://github.com/Danle360/mss-maven-web-app.git']]])
            }
        }

    stage ('Build') {
      steps {
      sh 'mvn clean package'
       }
    }

    stage ('Dev Environment Deployment') {
      steps {
      echo "deploying to DEV Env "
      deploy adapters: [tomcat9(credentialsId: 'apache-tomcat-9-username-passord', path: '', url: 'http://3.138.154.32:8085/')], contextPath: 'mss-walmart-dev-app', war: '**/*.war'
      }
    }

    stage('QA approve, pls approve this chagne for testing') {
            steps {
                input('Do you want to proceed?')
            }
        }
    //
    // stage('QA approve') {
    //     steps {
    //       notifySlack("Do you approve QA deployment? $jenkins_server_url/job/$JOB_NAME", notification_channel, [])
    //         input 'Do you approve QA deployment?'
    //         }
    //     }

    stage ('QA Deploy, Application functional Testing Has Started') {
      steps {
      echo "deploying to QA Env "
      deploy adapters: [tomcat9(credentialsId: 'apache-tomcat-9-username-passord', path: '', url: 'http://3.138.154.32:8085/')], contextPath: 'mss-walmart-qa-app', war: '**/*.war'
      }
    }

  }

  }