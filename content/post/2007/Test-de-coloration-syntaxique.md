---
Title: "Comment fusionner plusieurs listes en une seule avec Spring [Test de coloration syntaxique :-)]"
Date: 2007-01-30
Author: "Baptiste Mathus"
url: "2007/01/30/Test-de-coloration-syntaxique"
---



Attention, fonctionnalité en test :-). Merci
[GeShi](http://qbnz.com/highlighter/)

C'est pas mal du tout, mais il faut encore améliorer le rendu. Notamment
les espaces inter-lignes. Il faut aussi que je passe en mode "class" et
que j'écrive le code CSS associé au rendu que je veux donner à mon code.

     
    package fr.mipih.foundation.spring;

    import java.util.ArrayList;
    import java.util.List;

    import org.springframework.beans.factory.config.AbstractFactoryBean;

    /**
     * Classe Spring permettant de fusionner plusieurs tableaux ou listes en une seule.
     * 
     * @author Baptiste Mathus
     */
    public class ListMergerFactoryBean extends AbstractFactoryBean
    {
        List<String> mergedSourceList;

        public Class getObjectType()
        {
            return List.class;
        }

        public void setSourceLists(List[] sourceLists)
        {
            mergedSourceList = new ArrayList<String>();
            for(List<String> l : sourceLists)
            {
                mergedSourceList.addAll(l);
            }
        }

        @Override
        protected Object createInstance() throws Exception
        {
            logger.debug(mergedSourceList);
            return mergedSourceList;
        }
    }

