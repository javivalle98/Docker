node {
  stage 'Checkout'
  git url: 'https://github.com/javivalle98/Docker.git'

  stage 'build'
  docker.build('debian')

  stage 'deploy'
  fs.chmodSync('/deploy.sh', '+x');
  sh './deploy.sh'
}
