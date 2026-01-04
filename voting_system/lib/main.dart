import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show MultiProvider, ChangeNotifierProvider;
import 'package:voting_system/firebase_options.dart';
import 'package:voting_system/utils/routes/routes.dart';
import 'package:voting_system/utils/routes/routes_name.dart';
import 'package:voting_system/viewsModel/login_view_model.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Firebase Init Error:\n$e')),
        ),
      ),
    );
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
       ChangeNotifierProvider(create: (_) => LoginViewModel()),
      // ChangeNotifierProvider(create: (_) => AdminAuthViewModel()),
      // ChangeNotifierProvider(create: (_) => ElectionViewModel()),
      // ChangeNotifierProvider(create: (_) => VoteViewModel()),


    ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voting System',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       initialRoute: RoutesName.login,
       onGenerateRoute: Routes.generateRoute,
    )
    );
    
    
  }
}

