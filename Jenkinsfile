pipeline{
  environment { 
        registry = "ahmedchokri/wevioo" 
        registryCredential = '7b35ef37-b235-4fa7-8fd9-00c633a63e47' 
        dockerImage = '' 
    }
agent any
stages{
stage("build"){
steps {
sh "mvn compile"
}
}
stage("test"){
steps {
sh "mvn test"
}
}
stage("Nexus") {
steps {
sh " mvn clean package deploy:deploy-file -DgroupId=com.wevioo -DartifactId=wevioopfe -Dversion=0.0.1-SNAPSHOT -DgeneratePom=true -Dpackaging=jar -DrepositoryId=deploymentRepo -Durl=http://192.168.0.10:8081/repository/maven-snapshots/ -Dfile=target/wevioopfe-0.0.1-SNAPSHOT.jar"

}}
    stage('Building our image') { 
            steps { 
                script { 
                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 
                }
            } 
        }
   stage('Deploy our image') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
}
}