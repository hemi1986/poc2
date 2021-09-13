load('ext://restart_process', 'docker_build_with_restart')

def poc2(path = '.'):
  docker_build_with_restart('zerotrustpoc/poc2', path,
    build_args = { 'node_env': 'development' },
    entrypoint = 'node dist/main.js',
    live_update = [
      sync(path + '/src', '/app/src'),
      sync(path + '/package.json', '/app/package.json'),
      sync(path + '/package-lock.json', '/app/package-lock.json'),
      run('cd /app && npm install', trigger = [path + '/package.json', path + './package-lock.lock']),
      run('cd /app && npm run build', trigger = [path + '/dist']),
    ])
  k8s_yaml(path + '/App.yml')