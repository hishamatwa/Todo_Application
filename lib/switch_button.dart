import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';

class SwitchButton extends StatefulWidget {
  final Function enabled;
  final Function disabled;
  const SwitchButton({super.key,
     required this.enabled,
     required this.disabled

  });

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {


  @override
  Widget build(BuildContext context) {
    var vm =Provider.of<ProviderService>(context);
    var size =MediaQuery.of(context).size;
    bool state = vm.themeMode==ThemeMode.dark? true:false;
    return InkWell(
      onTap: (){
        state =!state;
        setState(() {});
        if(state==false) widget.disabled();
        if(state==true) widget.enabled();
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        width: size.width*0.14,
        height: size.height*0.04,
        alignment: (state==false)? Alignment.centerLeft : Alignment.centerRight,
        decoration: BoxDecoration(
          color: (state==false)? Colors.white : Colors.black,
          borderRadius: BorderRadius.circular(20),

        ),
        child: (state==false)? const Icon((Icons.light_mode),size: 20,) : const Icon((Icons.dark_mode),size: 20,color: Colors.white,),
      ),
    );
  }
}
