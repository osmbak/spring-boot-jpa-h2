pipeline {
    // 1. L'agent définit où le job doit s'exécuter (any = n'importe quel esclave disponible)
    agent any

    // 2. Optionnel : On définit les outils nécessaires comme Maven
    tools {
        maven 'maven-3' // Le nom doit correspondre à celui configuré dans Jenkins
    }

    stages {
        stage('Build') {
            steps {
                echo 'Job lance'
                // Utilisation de Maven pour builder le JAR
                bat 'mvn clean package'
            }
        }

        stage('Build Image') {
            steps {
                // Construction de l'image Docker
                bat 'docker build -t myapp:1 .'
            }
        }

        stage('Deploy') {
            steps {
                // Déploiement sur Kubernetes
                bat 'kubectl rollout restart deployment myapp'
            }
        }
    }

    // 3. Optionnel : Actions à faire en cas de succès ou d'échec
    post {
        success {
            echo 'Déploiement terminé avec succès !'
        }
        failure {
            echo 'Le pipeline a échoué. Vérifiez les logs.'
        }
    }
}