import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewAbout extends StatelessWidget 
{
  onSocialNetworkClick(context, value) async
  {
    String? url;

    switch(value)
    {
      case "WEB":
      url = "https://www.henriquefantini.com";
      break; 

      case "GITHUB":
      url = "https://www.github.com/hfantini";
      break; 

      case "LINKEDIN":
      url = "https://www.linkedin.com/in/henrique-fantini/";
      break; 

      case "MEDIUM":
      url = "https://medium.com/@henriquefantini2";
      break; 
    }

      if(url != null)
      {
        if (await canLaunch(url)) 
        {
          await launch(url);
        } 
        else 
        {
          ScaffoldMessenger.of(context).showSnackBar
          (
            SnackBar
            (
              content: Text("Impossível de abrir o browser. Acesse manualmente: $url"),
            )
          );

          Navigator.pop(context);
        }
      }
  }

  @override
  Widget build(BuildContext context) 
  {
    return Expanded
    (
      child: Container
      (
        color: Theme.of(context).backgroundColor,
        child: Column
        (
          children: 
          [
            Expanded
            (
              flex: 1,
              child: Center
              (
                child: Container
                (
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      Image.asset('assets/images/hf_logo.png'),
                      Container
                      (
                        height: 20,
                      ),
                      Text
                      (
                        "Projeto criado para fins de aprendizado com flutter.", 
                        textAlign: TextAlign.center,
                        style: TextStyle
                        (
                          fontSize: 14,
                          color: Theme.of(context).textTheme.caption?.color,
                          fontFamily: "roboto",
                          decoration: TextDecoration.none
                        ),
                      ),
                      Container
                      (
                        height: 10,
                      ),
                      Text
                      (
                        "2021/10/15", 
                        textAlign: TextAlign.center,
                        style: TextStyle
                        (
                          fontSize: 14,
                          color: Theme.of(context).textTheme.caption?.color,
                          fontFamily: "roboto",
                          decoration: TextDecoration.none
                        ),
                      )                      
                    ],
                  ),
                ),
              )
            ),
            Expanded
            (
              flex: 2,
              child: Container
              (
                color: Theme.of(context).hoverColor,
                child: Align
                (
                  alignment: const Alignment(0, 0.5),
                  child: Column
                  (
                    mainAxisSize: MainAxisSize.min,
                    children: 
                    [
                      Row
                      (
                        mainAxisSize: MainAxisSize.min,
                        children: 
                        [
                          Container
                          (
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton
                            (
                              onPressed: () async => 
                              {
                                await onSocialNetworkClick(context, "WEB")
                              }, 
                              child: Image.asset('assets/images/icon_site.png')
                            )
                          ),
                          Container
                          (
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton
                            (
                              onPressed: () => 
                              {
                                onSocialNetworkClick(context, "GITHUB")
                              }, 
                              child: Image.asset('assets/images/icon_github.png')
                            )
                          ),
                        ],
                      ),
                      Row
                      (
                        mainAxisSize: MainAxisSize.min,
                        children: 
                        [
                          Container
                          (
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton
                            (
                              onPressed: () => 
                              {
                                onSocialNetworkClick(context, "LINKEDIN")
                              }, 
                              child: Image.asset('assets/images/icon_linkedin.png')
                            )
                          ),
                          Container
                          (
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(5),
                            child: OutlinedButton
                            (
                              onPressed: () => 
                              {
                                onSocialNetworkClick(context, "MEDIUM")
                              }, 
                              child: Image.asset('assets/images/icon_medium.png')
                            )
                          ),
                        ],
                      ) 
                    ],
                  )
                ),
              )
            )
          ],
        )
      )
    );
  }
}