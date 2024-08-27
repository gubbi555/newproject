def call() {
  sh "echo hi form devops team"
  git branch: 'main', url: 'https://github.com/gubbi555/newproject.git'
  sh 'mvn package'
}
