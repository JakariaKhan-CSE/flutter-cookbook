import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AnimateWidgetPhysicsSimulation extends StatelessWidget {
  const AnimateWidgetPhysicsSimulation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(
        // ai logo take drag kora jabe
          child: FlutterLogo(
        size: 128,
      )),
    );
  }
}

///// A draggable card that moves back to [Alignment.center] when it's
// /// released.
class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key, required this.child});
final Widget child;
  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].

  Alignment _dragAlignment = Alignment.center;
  late Animation<Alignment> _animation;

  /// Calculates and runs a [SpringSimulation].
  void _runAnimation(Offset pixelsPerSecond,Size size)
  {
    _animation = _controller.drive(AlignmentTween(
      // jei jaigai drag kore sere deya hobe oi jaiga theke animation start hobe
      begin: _dragAlignment, // logo take drag korle aita value change hobe sathe position because setState
      end: Alignment.center  // sesh hobe center a eshe
    ));

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;

    final unitPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitPerSecond.distance;

    const spring = SpringDescription(
        mass: 30,  // mass mane vor ta beshi hole toto druto jabe halka hole aste aste jabe center a
        stiffness: 1,
        damping: 1  // aitar value joto beshi hobe toto fast center a cole ashbe
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this);

    _controller.addListener((){
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details)
      {
        _controller.stop();
      },
      onPanUpdate: (details){
        setState(() {
          //screen height or width 1/2 er beshi kono dike jete parbe na middle point theke compare korle tai 2 diye divide kora hoyese
          _dragAlignment += Alignment(details.delta.dx/(size.width/2),
              details.delta.dy/(size.height/2));
        });
      },
      // drag kora sere dilei animation ta kaj korbe
      onPanEnd: (details){
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
