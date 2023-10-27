import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'TU_API_KEY',
      authDomain: 'TU_AUTH_DOMAIN',
      projectId: 'TU_PROJECT_ID',
      storageBucket: 'TU_STORAGE_BUCKET',
      messagingSenderId: 'TU_MESSAGING_SENDER_ID',
      appId: 'TU_APP_ID',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          accentColor: Colors.orange,
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.pink],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Usuario (Correo Electrónico)'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Realiza la autenticación con Firebase aquí
                  // Si la autenticación es exitosa, redirige a la pantalla de Productos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Productos(),
                    ),
                  );
                },
                child: Text('Iniciar Sesión'),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterScreen(),
                    ),
                  );
                },
                child: Text('¿No tienes una cuenta? Regístrate aquí'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.pink],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.person,
                size: 100,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Apellido'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Realiza el registro con Firebase aquí
                  // Si el registro es exitoso, redirige a la pantalla de Productos
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Productos(),
                    ),
                  );
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Producto> productos = [
      Producto('Lavadora', 'Esta lavadora de carga frontal es la solución perfecta para mantener tu ropa impecable.', 'https://th.bing.com/th/id/R.16f6f0bc5b9cb80bd919021214afe029?rik=w4ilWQkpO86%2fSQ&pid=ImgRaw&r=0', 499.99),
      Producto('PlayStation 5', 'La PlayStation 5 (PS5) cambiará por completo tu experiencia de juego.', 'https://th.bing.com/th/id/R.397a11975ddb63f5b1718e7744676044?rik=UtR8He2f6vx%2fEw&pid=ImgRaw&r=0', 699.99),
      Producto('Reloj Rolex', 'Este reloj de pulsera clásico combina funcionalidad y estilo en un solo accesorio. Ya sea que necesites llevar un seguimiento preciso del tiempo o desees añadir un toque de elegancia a tu atuendo, este reloj es la elección perfecta.', 'https://th.bing.com/th/id/OIP.-6YA3E0hcCiU8lwad1b8uwHaJ5?pid=ImgDet&rs=1', 799.99),
      Producto('A53', 'Este teléfono celular inteligente es una poderosa herramienta que cabe en la palma de tu mano. Diseñado para mantenerte conectado, productivo y entretenido, es mucho más que un simple dispositivo de comunicación.', 'https://th.bing.com/th/id/R.cea0adf11d6ebf2b4ff895ed3a77f857?rik=aOkeze5bxfQuNw&pid=ImgRaw&r=0', 567.99),
      Producto('Victus 15', 'Esta computadora de escritorio de alto rendimiento es la solución definitiva para todas tus necesidades informáticas. Ya sea para el trabajo, la creatividad o el entretenimiento, esta computadora ofrece potencia y versatilidad en un elegante paquete.', 'https://th.bing.com/th/id/R.3809160390c2daa778c9103b6a5b569b?rik=ToUpyoSzNrTPYA&pid=ImgRaw&r=0', 100.99),
      Producto('A70', 'Este teléfono celular inteligente es una poderosa herramienta que cabe en la palma de tu mano. Diseñado para mantenerte conectado, productivo y entretenido, es mucho más que un simple dispositivo de comunicación.', 'https://th.bing.com/th/id/R.6bd9d984b7f3f63eee96816f960a8286?rik=g7b%2bwU9iUm3DEA&pid=ImgRaw&r=0', 984.99),
      // Agrega más productos aquí con sus respectivas URL de imagen y precios
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      body: ListView(
        children: productos.map((producto) {
          return ProductoCard(producto);
        }).toList(),
      ),
    );
  }
}

class Producto {
  final String nombre;
  final String descripcion;
  final String imageUrl;
  final double precio;

  Producto(this.nombre, this.descripcion, this.imageUrl, this.precio);
}

class ProductoCard extends StatelessWidget {
  final Producto producto;

  ProductoCard(this.producto);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            child: Image.network(
              producto.imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    producto.nombre,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Descripción: ${producto.descripcion}'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Precio: \$${producto.precio.toStringAsFixed(2)}'),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompraForm(producto),
                ),
              );
            },
            child: Text('Comprar'),
          ),
        ],
      ),
    );
  }
}

class CompraForm extends StatefulWidget {
  final Producto producto;

  CompraForm(this.producto);

  @override
  _CompraFormState createState() => _CompraFormState();
}

class _CompraFormState extends State<CompraForm> {
  int cantidad = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compra de ${widget.producto.nombre}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Precio: \$${(widget.producto.precio * cantidad).toStringAsFixed(2)}'),
            Row(
              children: <Widget>[
                Text('Cantidad: '),
                Flexible(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        cantidad = int.tryParse(value) ?? 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // Realiza la compra con la cantidad seleccionada
                // Puedes agregar lógica adicional aquí para procesar la compra
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Compra exitosa'),
                      content: Text('¡La compra de ${widget.producto.nombre} fue exitosa!'),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cerrar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
