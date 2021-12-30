import 'dart:io';

void main(List<String> args) async {
  print('here, just to be sure !');
  // Install UltroidCli
  var x = await Process.run(
    'curl -L -o ultroid https://github.com/BLUE-DEVIL1134/UltroidCli/releases/download/1.0.6/ultroid-linux',
    [],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
  stdout.write(x.stdout);
  stderr.write(x.stderr);
  
  // Give permissions to UltroidCli
  await Process.start(
    'chmod',
    [
      'u+x',
      'ultroid',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  await Process.run(
    './ultroid',
    [
      'init',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
  
  // Install Dependencies
  await Process.start(
    'pip',
    [
      'install', '-U', 'pip',
      '&&', 'pip', 'install', '--no-cache-dir', '-r', './TeamUltroid/requirements.txt',
      '&&', 'pip', 'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start UltroidCli
  await Process.run(
    './ultroid',
    [
      'heroku',
    ],
    runInShell: true,
    workingDirectory: './',
//     mode: ProcessStartMode.inheritStdio,
  );
}
