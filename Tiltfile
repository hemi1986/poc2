load('ext://restart_process', 'docker_build_with_restart')
docker_build_with_restart('wunderpark/poc2', '.',
  build_args = { 'node_env': 'development' },
  entrypoint = 'node dist/main.js',
  live_update = [
    sync('./src', '/app/src'),
    sync('./package.json', '/app/package.json'),
    sync('./package-lock.json', '/app/package-lock.json'),
    run('cd /app && npm install', trigger = ['./package.json', './package-lock.lock']),
    run('cd /app && npm run build', trigger = ['./dist']),
  ])
k8s_yaml('App.yml')