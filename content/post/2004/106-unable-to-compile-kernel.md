---
Title: "Unable to compile kernel"
Date: 2004-12-17
Author: "Baptiste Mathus"
---



Ce billet sera aussi en anglais mais je mettrais aussi les messages
d'erreurs produits par le noyau en français. En bref, gcc-3.4 : pas glop
pour la compilation du noyau (2.4.27).

Well, this one will be in english too although I'm going to put french
error messages too. It will let french users find the information in
typing the message in google.

If you're trying to compile the Linux kernel with gcc 3.4, you may have
noticed that it generates an error. I didn't find quickly because I had
forgotten I had changed the symbolic link to point to gcc-3.4 instead of
the default 3.3 version. To be able to compile, just be sure you're not
using gcc 3.4, it worked for me :-)

In english :

    sched.c:213: error: conflicting types for 'reschedule_idle'
    sched.c:210: error: previous declaration of 'reschedule_idle' was here
    sched.c:213: error: conflicting types for 'reschedule_idle'
    sched.c:210: error: previous declaration of 'reschedule_idle' was here
    sched.c:371: error: conflicting types for 'wake_up_process'
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:603: error: previous declaration of 'wake_up_process' was here
    sched.c:371: error: conflicting types for 'wake_up_process'
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:603: error: previous declaration of 'wake_up_process' was here
    sched.c:409: error: conflicting types for 'schedule_timeout'
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:148: error: previous declaration of 'schedule_timeout' was here
    sched.c:409: error: conflicting types for 'schedule_timeout'
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:148: error: previous declaration of 'schedule_timeout' was here
    sched.c:739: error: conflicting types for '__wake_up'
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:595: error: previous declaration of '__wake_up' was here
    ...
    make[3]: *** [sched.o] Error 1
    make[3]: Leaving directory `/usr/src/kernel-source-2.4.27/kernel'
    make[2]: *** [first_rule] Error 2
    make[2]: Leaving directory `/usr/src/kernel-source-2.4.27/kernel'
    make[1]: *** [_dir_kernel] Error 2
    make[1]: Leaving directory `/usr/src/kernel-source-2.4.27'
    make: *** [stamp-build] Error 2

In french :

    sched.c:213: erreur: types conflictuels pour « reschedule_idle »
    sched.c:210: erreur: déclaration précédente de « reschedule_idle » était ici
    sched.c:213: erreur: types conflictuels pour « reschedule_idle »
    sched.c:210: erreur: déclaration précédente de « reschedule_idle » était ici
    sched.c:371: erreur: types conflictuels pour « wake_up_process »
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:603: erreur: déclaration précédente de « wake_up_process » était ici
    sched.c:371: erreur: types conflictuels pour « wake_up_process »
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:603: erreur: déclaration précédente de « wake_up_process » était ici
    sched.c:409: erreur: types conflictuels pour « schedule_timeout »
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:148: erreur: déclaration précédente de « schedule_timeout » était ici
    sched.c:409: erreur: types conflictuels pour « schedule_timeout »
    /usr/src/kernel-source-2.4.27/include/linux/sched.h:148: erreur: déclaration précédente de « schedule_timeout » était ici
    sched.c:739: erreur: types conflictuels pour « __wake_up »
    ...
    make[3]: *** [sched.o] Erreur 1
    make[3]: Leaving directory `/usr/src/kernel-source-2.4.27/kernel'
    make[2]: *** [first_rule] Erreur 2
    make[2]: Leaving directory `/usr/src/kernel-source-2.4.27/kernel'
    make[1]: *** [_dir_kernel] Erreur 2
    make[1]: Leaving directory `/usr/src/kernel-source-2.4.27'
    make: *** [stamp-build] Erreur 2

