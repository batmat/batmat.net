---
Title: "Netscape 8 vs IE"
Date: 2005-05-26
Author: "Baptiste Mathus"
---



Énorme, [Netscape 8 fait planter le rendu XML
d'IE](http://blogs.msdn.com/ie/archive/2005/05/25/421763.aspx).

Heureusement, Microsoft a trouvé un *workaround* (le gras est de moi),
contournement quoi... :

> 1.  **Uninstall Netscape 8**
> 2.  START-\>RUN\
>     1.  Type: regedit
>     2.  Hit ENTER
>     3.  Navigate to the following:
>     4.  HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Internet
>         Explorer\\Plugins\\Extension
>     5.  Highlight and right-click the node titled "xml" and select
>         delete.
>     6.  Restart Internet Explorer
>
Nouvelle technique Microsoft : un produit pose des problème au nôtre.
Pas de problème, désinstallez le :-D

