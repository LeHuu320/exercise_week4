import 'dart:isolate';
import 'dart:math';
import 'dart:async';

void worker(SendPort mainSend) {
  final receive = ReceivePort();
  mainSend.send(receive.sendPort);

  final rnd = Random();

  Timer.periodic(Duration(seconds: 1), (_) {
    mainSend.send(rnd.nextInt(20)); // gửi số random 0–19
  });

  receive.listen((msg) {
    if (msg == "stop") {
      Isolate.exit();
    }
  });
}

void main() async {
  final receive = ReceivePort();
  SendPort? workerPort;

  await Isolate.spawn(worker, receive.sendPort);

  int sum = 0;

  receive.listen((msg) {
    if (msg is SendPort) {
      workerPort = msg;
    } else if (msg is int) {
      sum += msg;
      print("Received: $msg | Sum: $sum");

      if (sum > 100) {
        workerPort?.send("stop");
        print("Stopped worker.");
      }
    }
  });
}
