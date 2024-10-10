pipeline {
    agent {
        docker {
            image 'node:20.2.0-alpine3.17'  // Usando a imagem Node.js
            args '-p 3000:3000'  // Argumento para expor a porta 3000
        }
    }
    stages {
        stage('Build') { 
            steps {
                // Instalar dependências
                sh 'npm install'
                
                // Fazer o build da aplicação
                sh 'CI=false npm run build'
            }
        }
        
        stage('Package') {
            steps {
                // Empacotar os artefatos gerados
                sh 'tar -czf react-app.tar.gz build/'
                
                // Construir a imagem Docker
                script {
                    echo "Construindo a imagem Docker"
                    sh """
                        docker build -f Dockerfile.prod -t projeto-web:1.0 .
                    """
                }
            }
        }
        
        stage('Run Docker Image') {
            steps {
                // Rodar a imagem Docker
                script {
                    echo "Rodando a imagem Docker"
                    sh """
                        docker run -d -p 80:80 projeto-web:1.0
                    """
                }
            }
        }
    }
    post {
        success {
            // Arquivar o pacote gerado como artefato
            archiveArtifacts artifacts: 'react-app.tar.gz', allowEmptyArchive: false
            echo 'Build and package completed successfully!'
        }
        failure {
            echo 'Build or package failed.'
        }
    }
}
