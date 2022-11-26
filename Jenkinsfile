node{
     
    stage('SCM Checkout'){
        git url: 'https://github.com/aarimala/Java-weapp-Docker.git',branch: 'main'
    }
    
    stage(" Maven Clean Package"){
      def mavenHome =  tool name: "maven", type: "maven"
      def mavenCMD = "${mavenHome}/bin/mvn"
      sh "${mavenCMD} clean package"
      
    } 
    
    
    stage('Build Docker Image'){
        sh 'docker build -t arifarimala/java-web-app .'
    }
    
    stage('Push Docker Image'){
          //withCredentials([string(credentialsId: 'Docker_arif', variable: 'DockerHub-JavWebApp')]) {
          //withCredentials([string(credentialsId: 'Docker_pwd', variable: 'DockerHub-JavWebApp')]) {
          withCredentials([string(credentialsId: 'Docker_pwd', variable: 'java-web-app')]) {
          sh "docker login -u arifarimala -p ${Docker_pwd}"
        }
        sh 'docker push arifarimala/java-web-app'
     }
     
      stage('Run Docker Image In Dev Server'){
        
        def dockerRun = ' docker run  -d -p 8080:8080 --name java-web-app arifarimala/java-web-app'
         
         sshagent(['Ubuntu']) {
          sh 'ssh -o StrictHostKeyChecking=no ubuntu@3.110.147.148 docker stop java-web-app || true'
          sh 'ssh  ubuntu@3.110.147.148 docker rm java-web-app || true'
          sh 'ssh  ubuntu@3.110.147.148 docker rmi -f  $(docker images -q) || true'
          sh "ssh  ubuntu@3.110.147.148 ${dockerRun}"
       }
       
    }
     
     
}
