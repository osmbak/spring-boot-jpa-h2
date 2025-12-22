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
                echo 'Job lancer'
                // Utilisation de Maven pour builder le JAR
                bat 'mvn clean install package'
            }
        }

        stage('Build Image') {
            steps {
                withEnv(['DOCKER_HOST=npipe:////./pipe/docker_engine']) {
                    bat 'docker build -t myapp:1 .'
                }
            }
        }

        stage('Deploy') {
            steps {
                // On applique le fichier YAML. S'il n'existe pas, il le crée.
                      // S'il existe, il le met à jour.
                      bat 'kubectl apply -f deployment.yaml'

                      // Optionnel : On force le redémarrage pour être sûr qu'il prend la nouvelle image
                      bat 'kubectl rollout restart deployment myapp'
            }
        }
    }

    // 3. Optionnel : Actions à faire en cas de succès ou d'échec
    post {
        success {
            echo 'Deploiement termine avec succes !'
        }
        failure {
            echo 'Le pipeline a echoue. Verifiez les logs.'
        }
    }
}