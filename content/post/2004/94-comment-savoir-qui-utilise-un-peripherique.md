---
Title: "Comment savoir qui utilise un périphérique ?"
Date: 2004-11-03
Author: "Baptiste Mathus"
---



C'est un problème que je rencontre assez fréquemment. Je n'utilise pas
encore ALSA, je suis toujours à OSS par manque de temps pour changer,
c'en est peut-être la cause. Bref, lorsqu'un logiciel plante il peut
arriver qu'il subsiste en mémoire sans qu'on s'en aperçoive et occupe
/dev/dsp...

Et là, paf, lorsqu'on essaie d'écouter de la musique, et ben non !

Comment faire pour retrouver ce fichu processus qui m'empêche de faire
qu'est-ce que je veux ?

`fuser` ou `lsof` vous listent les processus en cours d'utilisation :

**Exemple :**

    baptiste@presario:~$ fuser -v /dev/dsp

                         USER        PID ACCESS COMMAND
    /dev/dsp             baptiste   4414 f....  xmms
                         baptiste   4416 f....  xmms
                         baptiste   4417 f....  xmms
                         baptiste   4418 f....  xmms
                         baptiste   4577 f....  xmms
                         baptiste   4578 f....  xmms
    baptiste@presario:~$ lsof  /dev/dsp
    COMMAND  PID     USER   FD   TYPE DEVICE SIZE  NODE NAME
    xmms    4414 baptiste   11w   CHR   14,3      80916 /dev/dsp
    xmms    4416 baptiste   11w   CHR   14,3      80916 /dev/dsp
    xmms    4417 baptiste   11w   CHR   14,3      80916 /dev/dsp
    xmms    4418 baptiste   11w   CHR   14,3      80916 /dev/dsp
    xmms    4577 baptiste   11w   CHR   14,3      80916 /dev/dsp
    xmms    4578 baptiste   11w   CHR   14,3      80916 /dev/dsp

Je vais essayer d'ajouter un billet dans cette catégorie plus
régulièrement à partir d'aujourd'hui.

