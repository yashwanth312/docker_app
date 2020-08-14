import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyHome(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var helpicon = Icon(
      Icons.help,
      color: Colors.white,
    );

    var settingsicon = Icon(
      Icons.settings,
      color: Colors.white,
    );

    var mybutton1 = IconButton(
      icon: helpicon,
      onPressed: deactivated,
    );

    var mybutton2 = IconButton(
      icon: settingsicon,
      onPressed: deactivated,
    );
    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Docker Cloud",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
          icon: Icon(Icons.dehaze, color: Colors.white),
          onPressed: deactivated),
      actions: <Widget>[
        mybutton1,
        mybutton2,
      ],
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LaunchRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch a Container",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Manage Services",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class LaunchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Launch a Container",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuickLaunchRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Quick Launch",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NormalContainerRoute()),
                    );
                  },
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch Normally",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: deactivated,
                  child: Container(
                    width: 300,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Launch via Docker-Compose",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

String nodeip;
String osname;
String imagename;
var port;
String network;
String mountpoint;
String containerpoint;
String url;

web(img_name, {cont_name, ports, net_name, sv_path, dv_path}) async {
  if (cont_name == null &&
      ports == null &&
      net_name == null &&
      sv_path == null &&
      dv_path == null) {
    var ip = "http://192.168.225.80/cgi-bin/flutter/1.py?img_name=${img_name}";
    url = ip;
  } else if (ports == null &&
      net_name == null &&
      sv_path == null &&
      dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/3.py?img_name=${img_name}&cont_name=${cont_name}";
    url = ip;
  } else if (cont_name == null && ports == null && net_name == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/2.py?img_name=${img_name}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (cont_name == null &&
      net_name == null &&
      sv_path == null &&
      dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/4.py?img_name=${img_name}&ports=${ports}";
    url = ip;
  } else if (cont_name == null &&
      ports == null &&
      sv_path == null &&
      dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/5.py?img_name=${img_name}&net_name=${net_name}";
    url = ip;
  } else if (cont_name == null && ports == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/6.py?img_name=${img_name}&net_name=${net_name}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (cont_name == null && net_name == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/7.py?img_name=${img_name}&ports=${ports}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (cont_name == null && sv_path == null && dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/8.py?img_name=${img_name}&net_name=${net_name}&ports=${ports}";
    url = ip;
  } else if (net_name == null && ports == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/9.py?img_name=${img_name}&cont_name=${cont_name}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (ports == null && sv_path == null && dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/10.py?img_name=${img_name}&cont_name=${cont_name}&net_name=${net_name}";
    url = ip;
  } else if (net_name == null && sv_path == null && dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/11.py?img_name=${img_name}&cont_name=${cont_name}&ports=${ports}";
    url = ip;
  } else if (cont_name == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/12.py?img_name=${img_name}&net_name=${net_name}&ports=${ports}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (ports == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/13.py?img_name=${img_name}&cont_name=${cont_name}&net_name=${net_name}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (net_name == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/14.py?img_name=${img_name}&cont_name=${cont_name}&ports=${ports}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  } else if (sv_path == null && dv_path == null) {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/15.py?img_name=${img_name}&cont_name=${cont_name}&net_name=${net_name}&ports=${ports}";
    url = ip;
  } else {
    var ip =
        "http://192.168.225.80/cgi-bin/flutter/16.py?img_name=${img_name}&cont_name=${cont_name}&net_name=${net_name}&ports=${ports}&sv_path=${sv_path}&dv_path=${dv_path}";
    url = ip;
  }
  var response = await http.get(url);
  print(response.body);
}

class QuickLaunchRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Quick Launch",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LaunchRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker2.png',
                fit: BoxFit.contain,
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the Image Name *',
                    ),
                    onChanged: (val) {
                      imagename = val;
                      return imagename;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your for Container OS Name *',
                    ),
                    onChanged: (val) {
                      osname = val;
                      return osname;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the port to be exported ',
                    ),
                    onChanged: (val) {
                      port = val;
                      return port;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Network Name ',
                    ),
                    onChanged: (val) {
                      network = val;
                      return network;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the Mount Point Address **',
                    ),
                    onChanged: (val) {
                      mountpoint = val;
                      return mountpoint;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter the directory to be mounted **',
                    ),
                    onChanged: (val) {
                      containerpoint = val;
                      return containerpoint;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    onPressed: () {
                      print(
                          "The vales are image=${imagename} , cont = ${osname} , port = ${port} , network = ${network} , v1=${mountpoint} , v2=${containerpoint}");
                      web(
                        imagename,
                        cont_name: osname,
                        ports: port,
                        net_name: network,
                        sv_path: mountpoint,
                        dv_path: containerpoint,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHome()),
                      );
                      Fluttertoast.showToast(
                        msg: "Container Launched",
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 20.0,
                        backgroundColor: Colors.black,
                      );
                    },
                    child: Text(
                      'Launch',
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  width: 350,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Text(' Note: * => Fields are Mandatory to be filled'),
                      Text('       ** => Fields are dependent on each other')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class NormalContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ManageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    deactivated() {
      Fluttertoast.showToast(
        msg: "Currrently Unavailable",
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 20.0,
        backgroundColor: Colors.black,
      );
    }

    var myappbar = AppBar(
      title: Title(
          color: Colors.white,
          child: Text(
            "Manage Services",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          )),
      backgroundColor: Colors.blue[800],
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHome()),
          );
        },
      ),
    );

    var mybody = Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'images/docker2.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 50),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContainerRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Containers",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImageRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Images",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.only(top: 200, left: 20, right: 20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NetworkRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Networking",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VolumeRoute()),
                    );
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      "Volumes",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Containeralllist extends StatefulWidget {
  @override
  _ContaineralllistState createState() => _ContaineralllistState();
}

class _ContaineralllistState extends State<Containeralllist> {
  var listbody = " Tap on the VIEW button";
  mylist() async {
    var list = await http.get("http://192.168.225.80/cgi-bin/cont/all.py");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            "Containers list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("View", style: TextStyle(fontSize: 40)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist();
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class Containerlist extends StatefulWidget {
  @override
  _ContainerlistState createState() => _ContainerlistState();
}

class _ContainerlistState extends State<Containerlist> {
  var listbody = " Tap on the VIEW button";
  mylist() async {
    var list = await http.get("http://192.168.225.80/cgi-bin/cont/list.py");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            "Containers list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("View", style: TextStyle(fontSize: 40)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist();
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class Startcont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contrm;
    rmall(rmcont) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/cont/start.py?str_cont=${rmcont}");
      contrm = all.body;
      return contrm;
    }

    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text("Start Container"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerRoute()));
          },
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name or ID of the container *',
                ),
                onChanged: (value) {
                  contrm = value;
                  return contrm;
                },
              ),
              FlatButton(
                onPressed: () {
                  rmall(contrm);
                  Fluttertoast.showToast(
                    msg: " Container Started ",
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 20.0,
                    backgroundColor: Colors.black,
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContainerRoute()));
                },
                child: Text("Start"),
                color: Colors.green,
              )
            ],
          )),
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Stopcont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contrm;
    rmall(rmcont) async {
      var all = await http
          .get("http://192.168.225.80/cgi-bin/cont/stop.py?stp_cont=${rmcont}");
      contrm = all.body;
      return contrm;
    }

    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text("Stop Container"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerRoute()));
          },
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name or ID of the container *',
                ),
                onChanged: (value) {
                  contrm = value;
                  return contrm;
                },
              ),
              FlatButton(
                onPressed: () {
                  rmall(contrm);
                  Fluttertoast.showToast(
                    msg: " Container Stopped ",
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 20.0,
                    backgroundColor: Colors.black,
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContainerRoute()));
                },
                child: Text("Stop"),
                color: Colors.red,
              )
            ],
          )),
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Reomvecont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contrm;
    rmall(rmcont) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/cont/remove.py?rm_cont=${rmcont}");
      contrm = all.body;
      return contrm;
    }

    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text("Container Removal"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerRoute()));
          },
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name or ID of the container *',
                ),
                onChanged: (value) {
                  contrm = value;
                  return contrm;
                },
              ),
              FlatButton(
                onPressed: () {
                  rmall(contrm);
                  Fluttertoast.showToast(
                    msg: " Container Removed ",
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    toastLength: Toast.LENGTH_SHORT,
                    fontSize: 20.0,
                    backgroundColor: Colors.black,
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContainerRoute()));
                },
                child: Text("Remove"),
                color: Colors.red,
              )
            ],
          )),
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Commitcont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contrm;
    String imgn;
    rmall(rmcont, imgn) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/cont/commit.py?cont_name=${rmcont}&img_name=${imgn}");
      contrm = all.body;
      return contrm;
    }

    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text("Container Commit"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContainerRoute()));
          },
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name or ID of the container *',
                ),
                onChanged: (value) {
                  contrm = value;
                  return contrm;
                },
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter the name of the image *',
                ),
                onChanged: (value) {
                  imgn = value;
                  return imgn;
                },
              ),
              FlatButton(
                  onPressed: () {
                    rmall(contrm, imgn);
                    Fluttertoast.showToast(
                      msg: " Commit Succesfull ",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContainerRoute()));
                  },
                  child: Text("Commit"),
                  color: Colors.blue)
            ],
          )),
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inspectcont extends StatefulWidget {
  @override
  _InspectcontState createState() => _InspectcontState();
}

class _InspectcontState extends State<Inspectcont> {
  var listbody = " Tap on the Inspect button";
  var netn;
  mylist(netname) async {
    var list = await http.get(
        "http://192.168.225.80/cgi-bin/cont/inspect.py?cont_name=${netname}");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Container Inspect",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the name of the container*',
                  ),
                  onChanged: (value) {
                    netn = value;
                    return netn;
                  },
                ),
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("Inspect", style: TextStyle(fontSize: 20)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist(netn);
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 500,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class Commandcont extends StatefulWidget {
  @override
  _CommandcontState createState() => _CommandcontState();
}

class _CommandcontState extends State<Commandcont> {
  var listbody = " Tap on the RUN button";
  var netn;
  var cmd;
  mylist(netname, cmd) async {
    var list = await http.get(
        "http://192.168.225.80/cgi-bin/cont/command.py?cmd=${cmd}&cont_name=${netname}");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Container Command",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContainerRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the name of the container*',
                  ),
                  onChanged: (value) {
                    netn = value;
                    return netn;
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the command to be run*',
                  ),
                  onChanged: (value) {
                    cmd = value;
                    return cmd;
                  },
                ),
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("RUN", style: TextStyle(fontSize: 20)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist(netn, cmd);
                    Fluttertoast.showToast(
                      msg: "Run Successful",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Center(
                  child: Container(
                    height: 400,
                    width: 400,
                    child: Text(
                      listbody,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class ContainerRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Containers",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker2.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Containerlist()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "View Running Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Containeralllist()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "View All Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Startcont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Start Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Inspectcont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Inspect Container",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Commandcont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Command in Container",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Stopcont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Stop Containers",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Commitcont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Commit Container",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Reomvecont()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Terminate Container",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Imagelist extends StatefulWidget {
  @override
  _ImagelistState createState() => _ImagelistState();
}

class _ImagelistState extends State<Imagelist> {
  var listbody = " Tap on the VIEW button";
  mylist() async {
    var list = await http.get("http://192.168.225.80/cgi-bin/image/list.py");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Image list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("View", style: TextStyle(fontSize: 40)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist();
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class RemoveImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/image/remove.py?rm_name=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the image*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.red[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: " Image Removed",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ImageRoute()));
                  },
                  child: Text("Remove")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Remove Image",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class DownloadImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/image/down.py?down_img=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the image*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.green[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: "Download Inprogress",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ImageRoute()));
                  },
                  child: Text("Download")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Download Image",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ImageRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inspectimage extends StatefulWidget {
  @override
  _InspectimageState createState() => _InspectimageState();
}

class _InspectimageState extends State<Inspectimage> {
  var listbody = " Tap on the Inspect button";
  var netn;
  mylist(netname) async {
    var list = await http.get(
        "http://192.168.225.80/cgi-bin/image/inspect.py?img_name=${netname}");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Image Inspect",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the name of the image*',
                  ),
                  onChanged: (value) {
                    netn = value;
                    return netn;
                  },
                ),
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("Inspect", style: TextStyle(fontSize: 20)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist(netn);
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 500,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Image Services",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset('images/docker2.png', fit: BoxFit.cover),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    color: Colors.yellow,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Imagelist()));
                        //      ourscript = ""
                        /*web(osname, imagename, port, network, mountpoint,
                            containerpoint);
                        Fluttertoast.showToast(
                          msg: "Data Retrieved",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );*/
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Images on server",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RemoveImage()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Remove an image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    child: InkWell(
                      splashColor: Colors.red,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inspectimage()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Inspect an image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.green,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DownloadImage()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Download any image",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Networkcheck extends StatefulWidget {
  @override
  _NetworkcheckState createState() => _NetworkcheckState();
}

class _NetworkcheckState extends State<Networkcheck> {
  var listbody = " Tap on the VIEW button";
  mylist() async {
    var list = await http.get("http://192.168.225.80/cgi-bin/network/list.py");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Networks list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NetworkRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("View", style: TextStyle(fontSize: 40)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist();
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class Networkcreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/network/create.py?new_net=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the network*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.green[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: "Network Created",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NetworkRoute()));
                  },
                  child: Text("Create")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Network Create",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NetworkRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Networkremove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/network/remove.py?rm_net=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the network*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.red[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: "Network Removed",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NetworkRoute()));
                  },
                  child: Text("Remove")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Network Remove",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NetworkRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Networkconnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var netn;
    var contn;
    dimg(imgname, contname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/network/connect.py?new_net=${imgname}&cont_name=${contname}");
      netn = all.body;
      return netn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the network*',
            ),
            onChanged: (value) {
              netn = value;
              return netn;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the container*',
            ),
            onChanged: (value) {
              contn = value;
              return contn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.blue,
              child: FlatButton(
                  onPressed: () {
                    dimg(netn, contn);
                    Fluttertoast.showToast(
                      msg: "Container Connected",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NetworkRoute()));
                  },
                  child: Text("Connect")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Network Connect",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NetworkRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Networkdisconnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var netn;
    var contn;
    dimg(imgname, contname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/network/disconnect.py?new_net=${imgname}&cont_name=${contname}");
      netn = all.body;
      return netn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the network*',
            ),
            onChanged: (value) {
              netn = value;
              return netn;
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the container*',
            ),
            onChanged: (value) {
              contn = value;
              return contn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.blue,
              child: FlatButton(
                  onPressed: () {
                    dimg(netn, contn);
                    Fluttertoast.showToast(
                      msg: "Container Disconnected",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NetworkRoute()));
                  },
                  child: Text("Disconnect")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Network Disconnect",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NetworkRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Inspectnetwork extends StatefulWidget {
  @override
  _InspectnetworkState createState() => _InspectnetworkState();
}

class _InspectnetworkState extends State<Inspectnetwork> {
  var listbody = " Tap on the Inspect button";
  var netn;
  mylist(netname) async {
    var list = await http.get(
        "http://192.168.225.80/cgi-bin/network/inspect.py?net_name=${netname}");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Network Inspect",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NetworkRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the name of the network*',
                  ),
                  onChanged: (value) {
                    netn = value;
                    return netn;
                  },
                ),
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("Inspect", style: TextStyle(fontSize: 20)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist(netn);
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 500,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class NetworkRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Networks",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker2.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    color: Colors.yellow,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Networkcheck()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Networks on server",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.green,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Networkcreate()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Create a Basic Network",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Inspectnetwork()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Inspect a Network",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Networkconnect()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Connect Container to Network",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Networkdisconnect()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Disconnect Container from Network",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Networkremove()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Remove a Basic Network",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Volumecheck extends StatefulWidget {
  @override
  _VolumecheckState createState() => _VolumecheckState();
}

class _VolumecheckState extends State<Volumecheck> {
  var listbody = " Tap on the VIEW button";
  mylist() async {
    var list = await http.get("http://192.168.225.80/cgi-bin/volume/list.py");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Volumes list",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VolumeRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("View", style: TextStyle(fontSize: 40)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist();
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 400,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class Volumecreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/volume/create.py?new_vol=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the volume*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.green[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: "Volume Created",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VolumeRoute()));
                  },
                  child: Text("Create")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Volume Create",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VolumeRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Volumeremove extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imgn;
    dimg(imgname) async {
      var all = await http.get(
          "http://192.168.225.80/cgi-bin/volume/remove.py?rm_vol=${imgname}");
      imgn = all.body;
      return imgn;
    }

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter the name of the volume*',
            ),
            onChanged: (value) {
              imgn = value;
              return imgn;
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Colors.red[300],
              child: FlatButton(
                  onPressed: () {
                    dimg(imgn);
                    Fluttertoast.showToast(
                      msg: "Volume Removed",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VolumeRoute()));
                  },
                  child: Text("Remove")))
        ],
      ),
    );
    var myscaf = Scaffold(
      appBar: AppBar(
        title: Text(
          "Volume Remove",
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VolumeRoute()));
            }),
      ),
      body: mybody,
    );
    return MaterialApp(
      home: myscaf,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Volumeinspect extends StatefulWidget {
  @override
  _VolumeinspectState createState() => _VolumeinspectState();
}

class _VolumeinspectState extends State<Volumeinspect> {
  var listbody = " Tap on the Inspect button";
  var netn;
  mylist(netname) async {
    var list = await http.get(
        "http://192.168.225.80/cgi-bin/volume/inspect.py?vol_name=${netname}");
    setState(() {
      listbody = list.body;
    });
    return listbody;
  }

  @override
  Widget build(BuildContext context) {
    var myscaf = Scaffold(
        appBar: AppBar(
          title: Text(
            " Volume Inspect",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VolumeRoute()));
              }),
          backgroundColor: Colors.blue[300],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey[300],
          child: Stack(children: [
            Container(
              height: double.infinity,
              width: double.infinity,
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter the name of the volume*',
                  ),
                  onChanged: (value) {
                    netn = value;
                    return netn;
                  },
                ),
                InkWell(
                  child: Center(
                      child: Card(
                    child: Text("Inspect", style: TextStyle(fontSize: 20)),
                    color: Colors.blue[300],
                  )),
                  onTap: () {
                    mylist(netn);
                    Fluttertoast.showToast(
                      msg: "Data Retrieved",
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 5,
                      toastLength: Toast.LENGTH_SHORT,
                      fontSize: 20.0,
                      backgroundColor: Colors.black,
                    );
                  },
                ),
                Container(
                  height: 500,
                  width: 400,
                  child: Text(
                    listbody,
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            )
          ]),
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myscaf,
    );
  }
}

class VolumeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var myhome = Scaffold(
      appBar: AppBar(
        title: Text(
          "Volumes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManageRoute()),
            );
          },
        ),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'images/docker2.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    color: Colors.yellow,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volumecheck()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Check Volmes on server",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 50),
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volumeinspect()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Inspect Volmes",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.all(20),
                    color: Colors.green,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volumecreate()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Create a Basic Volume",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.red,
                    child: InkWell(
                      splashColor: Colors.grey,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volumeremove()));
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          "Remove a Basic Volume",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}

class TerminateRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String contrm;

    var myappbar = AppBar(
      title: Title(
          color: Colors.red,
          child: Text(
            "Warning !",
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          )),
      backgroundColor: Colors.red,
    );

    var mybody = Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "Would you like to permanently terminate the container ?",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        //print(removalname);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContainerRoute()),
                        );
                        Fluttertoast.showToast(
                          msg: "Mentioned container is terminated",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Text(
                        "Yes",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContainerRoute()),
                        );
                        Fluttertoast.showToast(
                          msg: "Operation Cancelled",
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          toastLength: Toast.LENGTH_SHORT,
                          fontSize: 20.0,
                          backgroundColor: Colors.black,
                        );
                      },
                      child: Text(
                        "No",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    var myhome = Scaffold(
      appBar: myappbar,
      body: mybody,
    );

    return MaterialApp(
      home: myhome,
      debugShowCheckedModeBanner: false,
    );
  }
}
